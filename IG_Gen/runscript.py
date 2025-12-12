#!/usr/bin/env python3
import os
import argparse
import subprocess
import time
from concurrent.futures import ProcessPoolExecutor, as_completed
from pathlib import Path

INP_DIR = Path("DATASETv2")
IR_DIR  = Path("LLVM_IR")
OUT_DIR = Path("output_graph")
GEN_EXE = "./generate_IR"

IR_DIR.mkdir(parents=True, exist_ok=True)
OUT_DIR.mkdir(parents=True, exist_ok=True)


def run_with_timing(cmd):
    """
    Run a command and measure wall time in seconds.
    Returns (rc, elapsed_time).
    """
    start = time.perf_counter()
    try:
        subprocess.run(
            cmd,
            check=True,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL
        )
        rc = 0
    except subprocess.CalledProcessError:
        rc = 1
    end = time.perf_counter()
    return rc, end - start


def process_one_file(c_file: Path):
    """
    Process a single C file:
      1. clang/opt → IR + mem2reg IR
      2. generator → output txt
    With fault tolerance and precise timing of each stage.
    """

    base = c_file.stem
    ir_file = IR_DIR / f"{base}.ll"
    mem2reg_file = IR_DIR / f"{base}-mem2reg.ll"
    out_file = OUT_DIR / f"{base}-mem2reg.txt"

    # --- Stage 1: IR generation timing ---
    compile_cmd = ["/bin/bash", "compile_to_ir.sh", str(c_file)]
    rc_compile, t_compile = run_with_timing(compile_cmd)

    if rc_compile != 0 or not mem2reg_file.exists():
        return {
            "file": str(c_file),
            "status": "compile_fail",
            "compile_time": t_compile,
            "gen_time": None,
            "total_time": t_compile,
        }

    # --- Stage 2: Generator timing ---
    gen_cmd = ["/bin/bash", "run_generator.sh", GEN_EXE, str(mem2reg_file)]
    rc_gen, t_gen = run_with_timing(gen_cmd)

    status = "ok" if rc_gen == 0 and out_file.exists() else "generator_fail"

    return {
        "file": str(c_file),
        "status": status,
        "compile_time": t_compile,
        "gen_time": t_gen,
        "total_time": t_compile + t_gen,
    }


def collect_files(limit: int | None):
    count = 0
    for root, _, files in os.walk(INP_DIR):
        for f in files:
            if f.endswith(".c"):
                yield Path(root) / f
                count += 1
                if limit and count >= limit:
                    return


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--limit", type=int, default=None,
                        help="Process only first N files")
    args = parser.parse_args()

    c_files = list(collect_files(args.limit))
    print(f"Processing {len(c_files)} files.")

    workers = os.cpu_count() or 8

    with ProcessPoolExecutor(max_workers=workers) as ex:
        futures = {ex.submit(process_one_file, c): c for c in c_files}

        for fut in as_completed(futures):
            result = fut.result()
            print(
                f"{result['file']}  "
                f"[status={result['status']}]  "
                f"compile={result['compile_time']:.3f}s  ", end="")
            if result['gen_time']:
                print(f"gen={result['gen_time']:.3f}s  ", end="")
            else:
                print("N/A  ", end="")
            print(f"total={result['total_time']:.3f}s",
                flush=True
            )


if __name__ == "__main__":
    main()