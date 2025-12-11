#!/bin/bash

for inp in "$@"
do

  outputllpart="${inp/.c/.ll}"

  outputll="${outputllpart/DATASETv2/LLVM_IR}"

  clang -S -emit-llvm -O0 "$inp" -o "$outputll"

  sed -i 's/optnone//g' "$outputll"

  output="${outputll/.ll/-mem2reg.ll}"

  opt -passes='default<O0>,mem2reg' -S "$outputll" -o "$output"

done