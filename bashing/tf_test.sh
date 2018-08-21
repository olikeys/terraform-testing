#!/usr/bin/env bash
set -e

BASEDIR=$(dirname "$0")
GOOD_DIR="${BASEDIR}/good_example"

NUM_FILES=$(ls ./good_example/*.tf | wc -l)

CHECK_FILES=("backend.tf"
             "provider.tf"
	     "variables.tf")

# We should have at least 4 Terraform files
[ "${NUM_FILES}" -le "${#CHECK_FILES[@]}" ] && { echo "Too few files"; exit 1; }

# We should have the following; provider.tf, variables.tf  and backend.tf
for files in "${CHECK_FILES[@]}" 
do
  [ ! -f "${GOOD_DIR}/${files}" ] && { echo "${files} not found"; exit 1; }
done





# Make sure that we've failed correctly
echo "apparently all checks passed, were a'ok"
