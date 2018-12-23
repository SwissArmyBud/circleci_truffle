#!/bin/bash

# Grab working directory
BASE=$(pwd)
# Grab working directory
TESTS=$(ls $BASE/services/ | grep sol-)

mkdir $BASE/services/artifacts

set -o pipefail

# For each test directory
for SOLTEST in $TESTS ; do
  # Move a fake package.json to the test directory to satisfy truffle
  cp ./services/config/sol-config.json ./services/$SOLTEST/package.json
  # Copy Ganache settings into test directory to satisfy truffle
  cp ./services/config/truffle-config.js ./services/$SOLTEST/truffle.js
  # Move into test directory
  cd ./services/$SOLTEST
  npm i
  # Run tests and tee output to results artifact
  ./node_modules/.bin/truffle test | tee $BASE"/services/artifacts/"$SOLTEST"_results.out"
  EXIT=$?
  if [ $EXIT -gt 0 ]
    then
    echo "TEST FAILED - EXITING SUITE"
    EXIT $EXIT
  fi
  # Clear out scaffolding files from test directory
  rm $BASE/services/$SOLTEST/package.json
  rm $BASE/services/$SOLTEST/truffle.js
  # Go home
  cd $BASE
done
