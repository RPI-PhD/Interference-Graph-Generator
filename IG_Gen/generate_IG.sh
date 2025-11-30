#!/bin/bash
TIMEOUT_SECONDS=30

all_files=$@
test_count=$#
fail_count=0
failed_tests=""
C_PROC=./mem2reg_proc
CPP_PROC=./generate_IR

for gen_file in $all_files
do
  ll_fl="${gen_file%.ll}"
  mem2reg_fl="${ll_fl}-mem2reg.ll"


	echo "===== ${gen_file} ====="
	rm -f testfs # Tidy up if rerunning
	start_time=$(date +%s%N)
	timeout ${TIMEOUT_SECONDS} "$C_PROC" "${gen_file}"
	rc=$?
	end_time=$(date +%s%N)
	time_taken=$((end_time - start_time))
  time_taken_in_ms=$((time_taken / 1000000))

	if [ ${rc} -eq 0 ]; then
		echo "PASS"
	else
    	if [ ${rc} -eq 124 ]; then
    		echo "FAIL (${TIMEOUT_SECONDS} second timeout)"
    	else
    		echo "FAIL (rc = ${rc})"
        fi
        failed_tests+="${gen_file}:(rc=${rc}) "
        fail_count=$((fail_count + 1))
	fi

	echo "${gen_file} runtime: ${time_taken_in_ms} ms"
done

echo "${fail_count} out of ${test_count} generations failed."

if [ ${fail_count} -gt 0 ]
then
    echo "Failed tests: ${failed_tests}"
fi