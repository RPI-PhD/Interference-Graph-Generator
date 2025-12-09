#!/bin/bash
TIMEOUT_SECONDS=30

GEN_EXE="$1"
GEN_EXE="$1"
IR_FILES=("$@")
gen_count=$#
fail_count=0
failed_gens=""

for ir_file in "${IR_FILES[@]}"
do

  abs_ir_file=$(realpath "$ir_file")

	start_time=$(date +%s%N)
	timeout "${TIMEOUT_SECONDS}" "${GEN_EXE}" "${abs_ir_file}"
	rc=$?
	end_time=$(date +%s%N)
	time_taken=$((end_time - start_time))
  time_taken_in_ms=$((time_taken / 1000000))

	if [ ${rc} -ne 0 ]; then
    	if [ ${rc} -eq 124 ]; then
    		echo "FAIL (${TIMEOUT_SECONDS} second timeout)"
    	else
    		echo "FAIL (rc = ${rc})"
        fi
        failed_gens+="${ir_file}:(rc=${rc}) "
        fail_count=$((fail_count + 1))
	fi

	echo "${ir_file} runtime: ${time_taken_in_ms} ms"
done

echo "${fail_count} out of ${gen_count} tests failed."

if [ ${fail_count} -gt 0 ]
then
    echo "Failed tests: ${failed_gens}"
fi
