#!/usr/bin/env bats
GOOD_DIR="./good_example"
CHECK_FILES=("backend.tf"
             "provider.tf"
             "variables.tf")

@test "provider, backend and variables should exist" {  
  for files in "${CHECK_FILES[@]}"
  do
    [ -f "${GOOD_DIR}/${files}" ]
  done
}

@test "There must be backend, provider, variable plus one other" {
  result="$(ls ./good_example/*.tf | wc -l)"
  [ "$result" -gt "${#CHECK_FILES[@]}"  ]
}
