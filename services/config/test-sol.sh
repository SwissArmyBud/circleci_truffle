#!/bin/bash

# Grab working directory
BASE=$(pwd)
# Grab working directory
TESTS=$(ls $BASE/services/ | grep sol-)

mkdir $BASE/services/artifacts

# Pipe fails "from the left" - tee must not capture errors in test stream
set -o pipefail
# Alternative to exiting on bad exit code, instead exits on ANY failed command
# set -e

# Alternatively to immeiate exit, create an exit code tracker
# EXIT=0

# For each test directory
for SOLTEST in $TESTS ; do
  # Copy Ganache settings into test directory to satisfy truffle
  cp ./services/config/truffle-config.js ./services/$SOLTEST/truffle.js
  # Move into test directory
  cd ./services/$SOLTEST
  npm i
  # Run tests and tee output to results artifact
  ./node_modules/.bin/truffle test | tee $BASE"/services/artifacts/"$SOLTEST"_results.out"
  # Capture and test exit code from Truffle, pass up the chain if bad value
  EXIT=$?
  if [ $EXIT -gt 0 ]
    then
    echo "TEST FAILED - EXITING SUITE"
    exit $EXIT
  fi
  # Clear out scaffolding files from test directory
  rm $BASE/services/$SOLTEST/truffle.js
  # Go home
  cd $BASE
done

# Alternative to immediate exit
# exit $EXIT
