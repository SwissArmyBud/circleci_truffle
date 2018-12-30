#!/bin/bash

# Grab working directory
BASE=$(pwd)
# Grab test directories
TESTS=$(ls $BASE/services/ | grep dart-)

# Create artifacts for CircleCI recovery
mkdir $BASE/services/artifacts

# Pipe fails "from the left" - tee must not capture errors in test stream
set -o pipefail
# Alternative to exiting on bad exit code, instead exits on ANY failed command
# set -e

# Function to test exit codes and throw or continue
function failOnBadExit() {
    if [ $1 -ne 0 ]; then
        echo "Failed with exit code $1."
        exit $1
    fi
}

# Alternatively to immeiate exit, create an exit code tracker
# EXIT=0

# Add dart path to shell
PATH="$PATH:/usr/lib/dart/bin"

# For each test directory
for DART_TEST in $TESTS ; do

  # Move into test directory
  cd $BASE/services/$DART_TEST

  # Run pre-test scripting for project dependant vars, etc
  echo "Running source for project: $DART_TEST"
  source "./projectCI.sh"

  # Optionally, include some filtered actions when set from CI env vars
  if [[ -n "$DARTLANG_CI_TEST_FILTER" ]] # Loaded from CircleCI project settings
    then
    for DART_PROJ in $DARTLANG_CI_TEST_FILTER ; do
      if [ $DART_TEST == $DART_PROJ ]
        then
        echo "Found $DART_TEST as $DART_PROJ in \$DARTLANG_CI_TEST_FILTER"
        # Do something here if it's important the project be included in filter
        echo "[WARN] -> No current filter-based actions are implemented!"
      fi
    done
  fi

  # Optionally, only do certian things for the current project branch
  if [[ $CIRCLE_BRANCH == $DART_TEST ]] # From CI env vars for each build
    then
    # Do something for only the current project branch
    echo "[INFO] -> This project is linked to the current git branch!"

    # Alert for test runner
    echo "[INFO] -> This project will now be tested..."

    # Get dependencies, fail shell on bad exit
    pub get
    failOnBadExit $?

    # Run tests and tee output to report, fail shell on bad exit
    pub run build_runner test --fail-on-severe -- -p $DART_BUILD_PLATFORM --reporter expanded |
    tee $BASE"/services/artifacts/"$DART_TEST"_results.out"
    failOnBadExit $?
  else
    # Skip other projects
    echo "[WARN] -> This project is being ignored by CI as unlinked to branch!"
  fi

done
