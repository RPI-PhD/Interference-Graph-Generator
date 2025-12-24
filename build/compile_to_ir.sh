#!/bin/bash
set -euo pipefail

inp="$1"
out_mem2reg="$2"

tmp_ll="${out_mem2reg%-mem2reg.ll}.ll"

clang -S -emit-llvm -O0 "$inp" -o "$tmp_ll"
sed -i 's/optnone//g' "$tmp_ll"
opt -passes='default<O0>,mem2reg' -S "$tmp_ll" -o "$out_mem2reg"