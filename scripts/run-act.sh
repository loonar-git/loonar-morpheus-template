#!/bin/bash

REPO_ROOT=$(git rev-parse --show-toplevel)

cd $REPO_ROOT || exit 1

LESS=FRX act


timeout 300 act
STATUS=$?
if [ $STATUS -eq 124 ]; then
  echo "GitHub Actions workflow timed out. Commit aborted."
  exit 1
elif [ $STATUS -ne 0 ]; then
  echo "GitHub Actions workflow failed. Commit aborted."
  exit 1
else
  echo "GitHub Actions workflow passed."
  exit 0
fi
