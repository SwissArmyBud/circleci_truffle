#!/bin/bash

# Grab working directory
BASE=$(pwd)
# Grab test directories
TESTS=$(ls $BASE/services/ | grep dart-)

mkdir $BASE/services/artifacts

# Pipe fails "from the left" - tee must not capture errors in test stream
set -o pipefail
# Alternative to exiting on bad exit code, instead exits on ANY failed command
# set -e

# Alternatively to immeiate exit, create an exit code tracker
# EXIT=0

# For each test directory
for DARTTEST in $TESTS ; do
  echo "Running tests for service: $DARTTEST"
  if [ -n $DARTLANG_CI_TEST_FILTER ]
    then
    for DARTPROJ in $DARTLANG_CI_TEST_FILTER ; do
      if [ $DARTTEST == $DARTPROJ ]
        then
        echo "Found $DARTTEST as $DARTPROJ in \$DARTLANG_CI_TEST_FILTER"
      fi
    done
  fi
  # Move into test directory
  cd $BASE/services/$DARTTEST
  source ./CIparams.sh
  # Get dependencies
  pub get
  # Run tests and tee output to report
  pub run build_runner test --fail-on-severe -- -p $DART_BUILD_PLATFORM | tee $BASE"/services/artifacts/"$DARTTEST"_results.out"
  # Capture and test exit code from pub, pass up the chain if bad value
  EXIT=$?
  if [ $EXIT -gt 0 ]
    then
    echo "TEST FAILED - EXITING SUITE"
    exit $EXIT
  fi
done
