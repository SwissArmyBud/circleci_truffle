#!/bin/bash

# Set build/test platform for build_runner
DART_BUILD_PLATFORM="chrome"
echo "Building projcect for $DART_BUILD_PLATFORM"

# Set project as mandatory filter participant
DARTLANG_CI_TEST_FILTER="$DARTLANG_CI_TEST_FILTER $DART_TEST"
echo "Forced filter for: $DART_TEST"
