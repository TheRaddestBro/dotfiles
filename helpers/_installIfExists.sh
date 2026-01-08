#!/bin/bash

# Start with an empty array
pkg_list=()

# loop through each passed package name, and only add it to pkg_list if it exists.
for arg in "$@"; do
  PACKAGE_NAME=$arg
  ./_pkgExists.sh "$PACKAGE_NAME"
  if [ $? -eq 0 ]; then
    pkg_list+=("$PACKAGE_NAME")
  else
    echo "$arg is not a valid apt package. Skipping."
  fi
done

# Build a space-separated string from the string array
final_string="${pkg_list[*]}"
echo $final_string

sudo nala install -y --no-install-recommends $final_string
