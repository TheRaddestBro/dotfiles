#!/bin/bash

output="unknown"
if [[ -f "/etc/os-release" ]]; then
  # Source the file to load the variables
  . /etc/os-release
  if [[ "$ID" == "fedora" ]]; then
    output="fedora"
  elif [[ "$ID" == "ubuntu" ]]; then
    output="ubuntu"
  elif [[ "$ID" == "debian" ]]; then
    output="debian"
  elif [[ "$ID" == "arch" ]]; then
    output="arch"
  fi
elif [[ -f "/etc/debian_version" ]]; then
  output="debian"
elif [ -f "/etc/arch-release" ]; then
  output="arch"
fi

echo $output

# If no distro was found, exit with an error
if [[ "$output" == "unknown" ]]; then
  exit 1
else
  exit 0
fi
