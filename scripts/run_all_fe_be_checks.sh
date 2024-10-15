#!/opt/homebrew/bin/bash

# Run all the checks for the front-end and back-end
# This script will run the following commands:
# 1. yarn lint and yarn test and yarn check-types
# 2. rubocop against all modified ruby files

cdapp
echo "Running front-end checks..."
echo "Running yarn lint..."
yarn lint
echo "Running yarn test..."
yarn test
echo "Running yarn check-types..."
yarn check-types

echo "===================================="

echo "Running back-end checks..."
echo "Running rubocop..."
git ls-files -m | xargs ls -1 2>/dev/null | grep \\.rb$ | xargs rubocop

echo "===================================="
echo "All checks completed!"
