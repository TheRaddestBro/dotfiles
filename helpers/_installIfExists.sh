#!/bin/bash

helpersPath=$(dirname "$0")
distroName=$(./${helpersPath}/_getDistro.sh)

# Start with an empty array
pkg_list=()

# loop through each passed package name, and only add it to pkg_list if it exists.
for arg in "$@"; do
  PACKAGE_NAME=$arg
  ./${helpersPath}/_pkgExists.sh "$PACKAGE_NAME"
  if [ $? -eq 0 ]; then
    pkg_list+=("$PACKAGE_NAME")
  else
    echo "$arg is not a valid apt package. Skipping."
  fi
done

# Build a space-separated string from the string array
final_string="${pkg_list[*]}"
echo $final_string

if [[ $? -eq 1 ]]; then
  exit 1
fi

if [[ "$distroName" == "debian" || "$distroName" == "ubuntu" ]]; then
  if [ -f /usr/bin/nala ]; then
    sudo nala install -y --no-install-recommends $final_string
  else
    sudo apt install -y $final_string
  fi
elif [[ "$distroName" == "arch" ]]; then
  pacman -S --noconfirm $final_string
fi
