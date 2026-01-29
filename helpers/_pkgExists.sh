#!/bin/bash

PACKAGE=$1

helpersPath=$(dirname "$0")
distroName=$(./${helpersPath}/_getDistro.sh)

# Execute apt-cache command and capture output

if [[ "$distroName" == "debian" || "$distroName" == "ubuntu" ]]; then
  output=$(apt-cache search --names-only "^${PACKAGE}$")
elif [[ "$distroName" == "arch" ]]; then
  output=$(pacman -Ssq "^${PACKAGE}$" | grep "${PACKAGE}")
fi

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
