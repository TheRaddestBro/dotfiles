#!/bin/bash

PACKAGE=$1

# Execute apt-cache command and capture output
output=$(apt-cache search --names-only "^${PACKAGE}$")

# Check the exit status of the previous command ($?)
if [ $? -eq 0 ]; then
  if [ -n "$output" ]; then
    exit 0
  else
    exit 1
  fi
else
  exit 1
fi
