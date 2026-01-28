#!/bin/bash

output="unknown"
if [ -f "/etc/arch-release" ]; then
  output="arch"
elif [[ -f "/etc/os-release" ]]; then
  output="ubuntu"
elif [[ -f "/etc/debian_version" ]]; then
  output="debian"
fi

echo $output

# If no distro was found, exit with an error
if [[ "$output" == "unknown" ]]; then
  exit 1
else
  exit 0
fi
