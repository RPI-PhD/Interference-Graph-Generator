#!/bin/bash
TIMEOUT_SECONDS=30

all_tests=$@
test_count=$#
fail_count=0
failed_tests=""

for test_file in $all_tests
do
	echo "===== ${test_file} ====="
	rm -f testfs # Tidy up from previous tests
	start_time=$(date +%s%N)
	timeout ${TIMEOUT_SECONDS} "${test_file}"
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
        failed_tests+="${test_file}:(rc=${rc}) "
        fail_count=$((fail_count + 1))
	fi

	echo "${test_file} runtime: ${time_taken_in_ms} ms"
done

echo "${fail_count} out of ${test_count} tests failed."

if [ ${fail_count} -gt 0 ]
then
    echo "Failed tests: ${failed_tests}"
fi
