#!/usr/bin/env python3
"""
process_dataset.py

Parallel, fault-tolerant pipeline for:
  DATASETv2/*.c -> LLVM_IR/*.ll -> LLVM_IR/*-mem2reg.ll -> output_graph/*-mem2reg.txt

Features:
 - Parallel processing using ProcessPoolExecutor
 - Per-stage timing (compile and generator), formatted to 3 decimal places
 - Captures stderr for compile and generator steps and returns it with results
 - Sorts output so failures are printed first (with failure reasons and stderr)
 - --limit to process only a small number for testing
 - --verbose to print stderr for successes as well
"""

from concurrent.futures import ProcessPoolExecutor, as_completed
from pathlib import Path
import argparse
import subprocess
import time
import os
import textwrap

# -- configuration (adjust paths if needed)
INP_DIR = Path("DATASETv2")
IR_DIR  = Path("LLVM_IR")
OUT_DIR = Path("output_graph")
GEN_EXE = "./generate_IR"

# create output dirs if not exist
IR_DIR.mkdir(parents=True, exist_ok=True)
OUT_DIR.mkdir(parents=True, exist_ok=True)

# how many characters of stderr to keep for printing (to avoid HUGE dumps)
STDERR_TRUNCATE = 2000


def run_command_capture(cmd, timeout=None):
    """
    Run command, capture stderr, measure elapsed wall time.
    Returns: (rc, elapsed_seconds, stderr_str)
    """
    start = time.perf_counter()
    try:
        proc = subprocess.run(
            cmd,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.PIPE,
            check=False,
            text=True,
            timeout=timeout
        )
        rc = proc.returncode
        stderr = proc.stderr or ""
    except subprocess.TimeoutExpired as tex:
        rc = 124  # match common timeout exit-code used earlier
        stderr = tex.stderr or ""
    except Exception as e:
        rc = 1
        stderr = str(e)
    end = time.perf_counter()
    elapsed = end - start
    # truncate stderr to reasonable size
    if len(stderr) > STDERR_TRUNCATE:
        stderr = stderr[:STDERR_TRUNCATE] + "\n...[truncated]"
    return rc, elapsed, stderr


def process_one_file(c_file: Path, timeout_seconds=None):
    """
    Process a single C file:
      - compile_to_ir.sh (produces LLVM_IR/{base}.ll and -mem2reg.ll)
      - run_generator.sh GEN_EXE LLVM_IR/{base}-mem2reg.ll

    Returns a dict summarizing status, timings, rc, and stderr for each stage.
    """
    base = c_file.stem
    ir_file = IR_DIR / f"{base}.ll"
    mem2reg_file = IR_DIR / f"{base}-mem2reg.ll"
    out_file = OUT_DIR / f"{base}-mem2reg.txt"

    # Stage 1: compile (clang + opt) via your script
    compile_cmd = ["/bin/bash", "compile_to_ir.sh", str(c_file)]
    rc_compile, t_compile, stderr_compile = run_command_capture(compile_cmd, timeout=None)

    if rc_compile != 0 or not mem2reg_file.exists():
        return {
            "file": str(c_file),
            "status": "compile_fail",
            "compile_time": t_compile,
            "compile_rc": rc_compile,
            "compile_stderr": stderr_compile,
            "gen_time": None,
            "gen_rc": None,
            "gen_stderr": None,
            "total_time": t_compile,
        }

    # Stage 2: run generator (use your wrapper to enforce timeout per call)
    gen_cmd = ["/bin/bash", "run_generator.sh", GEN_EXE, str(mem2reg_file)]
    rc_gen, t_gen, stderr_gen = run_command_capture(gen_cmd, timeout=timeout_seconds)

    status = "ok" if rc_gen == 0 and out_file.exists() else "generator_fail"

    return {
        "file": str(c_file),
        "status": status,
        "compile_time": t_compile,
        "compile_rc": rc_compile,
        "compile_stderr": stderr_compile,
        "gen_time": t_gen,
        "gen_rc": rc_gen,
        "gen_stderr": stderr_gen,
        "total_time": t_compile + (t_gen or 0),
    }


def collect_files(limit: int | None):
    """
    Stream .c files with minimal memory use. Returns generator.
    """
    count = 0
    for root, _, files in os.walk(INP_DIR):
        for f in files:
            if f.endswith(".c"):
                yield Path(root) / f
                count += 1
                if limit and count >= limit:
                    return


def pretty_secs(s):
    """Format seconds to 3 decimal places"""
    if s is None:
        return "N/A"
    return f"{s:.3f}s"


def main():
    parser = argparse.ArgumentParser(description="Parallel pipeline for large dataset")
    parser.add_argument("--limit", type=int, default=None,
                        help="Process only the first N files (for testing)")
    parser.add_argument("--workers", type=int, default=None,
                        help="Number of parallel workers (defaults to os.cpu_count())")
    parser.add_argument("--timeout", type=int, default=30,
                        help="Per-generator timeout in seconds (passed to run_generator.sh wrapper)")
    parser.add_argument("--verbose", action="store_true",
                        help="If set, print stderr for successful files as well")
    args = parser.parse_args()

    workers = args.workers or (os.cpu_count() or 8)
    timeout_seconds = args.timeout

    # gather files (as list to create futures reliably)
    c_files = list(collect_files(args.limit))
    if not c_files:
        print("No .c files found (check DATASETv2).")
        return

    print(f"Processing {len(c_files)} files with {workers} worker(s). Timeout per generator = {timeout_seconds}s\n")

    results = []
    with ProcessPoolExecutor(max_workers=workers) as ex:
        futures = {ex.submit(process_one_file, c, timeout_seconds): c for c in c_files}
        for fut in as_completed(futures):
            try:
                res = fut.result()
            except Exception as ex:
                # unexpected worker exception
                cfile = str(futures.get(fut, "unknown"))
                res = {
                    "file": cfile,
                    "status": "worker_exception",
                    "compile_time": None,
                    "compile_rc": None,
                    "compile_stderr": str(ex),
                    "gen_time": None,
                    "gen_rc": None,
                    "gen_stderr": None,
                    "total_time": None,
                }
            results.append(res)

    # sort: failures first (any status != ok), then by filename
    def sort_key(r):
        return (0 if r["status"] != "ok" else 1, r["file"])

    results.sort(key=sort_key)

    # Print failures first (with stderr); then successes with compact timing
    failures = [r for r in results if r["status"] != "ok"]
    successes = [r for r in results if r["status"] == "ok"]

    if failures:
        print("---- FAILURES ----")
        for r in failures:
            print(f"{r['file']}  [status={r['status']}]")
            if r["status"] == "compile_fail":
                print(f"  compile rc={r['compile_rc']}  time={pretty_secs(r['compile_time'])}")
                if r["compile_stderr"]:
                    print("  compile stderr:")
                    print(textwrap.indent(r["compile_stderr"].rstrip(), "    "))
            elif r["status"] == "generator_fail":
                print(f"  gen rc={r['gen_rc']}  compile_time={pretty_secs(r['compile_time'])}  gen_time={pretty_secs(r['gen_time'])}")
                if r["gen_stderr"]:
                    print("  generator stderr:")
                    print(textwrap.indent(r["gen_stderr"].rstrip(), "    "))
            else:
                # generic other statuses (e.g., worker_exception)
                if r.get("compile_stderr"):
                    print("  compile stderr:")
                    print(textwrap.indent(r["compile_stderr"].rstrip(), "    "))
                if r.get("gen_stderr"):
                    print("  gen stderr:")
                    print(textwrap.indent(r["gen_stderr"].rstrip(), "    "))
            print()
    else:
        print("No failures.\n")

    # successes
    if successes:
        print("---- SUCCESSES ----")
        for r in successes:
            line = (
                f"{r['file']}  [status=ok]  "
                f"compile={pretty_secs(r['compile_time'])}  "
                f"gen={pretty_secs(r['gen_time'])}  "
                f"total={pretty_secs(r['total_time'])}"
            )
            print(line)
            if args.verbose and r.get("compile_stderr"):
                print("  compile stderr (verbose):")
                print(textwrap.indent(r["compile_stderr"].rstrip(), "    "))
            if args.verbose and r.get("gen_stderr"):
                print("  gen stderr (verbose):")
                print(textwrap.indent(r["gen_stderr"].rstrip(), "    "))
        print()

    # summary
    print("Summary:")
    print(f"  total files considered: {len(results)}")
    print(f"  failures: {len(failures)}")
    print(f"  successes: {len(successes)}")


if __name__ == "__main__":
    main()