#!/bin/bash

DART_BUILD_PLATFORM="vm"
echo "Build platform set as $DART_BUILD_PLATFORM"

# Set project as mandatory filter participant
# DARTLANG_CI_TEST_FILTER="$DARTLANG_CI_TEST_FILTER $DART_TEST"
# echo "Forced filter for: $DART_TEST"
echo "ENV dependence on filter for: $DART_TEST"
