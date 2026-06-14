#!/bin/bash
echo "Installing GCM from binary."

helpersPath="../helpers"
distroName=$(./${helpersPath}/_getDistro.sh)

if [[ "$distroName" != "apple" ]]; then
  echo "This script will only work on apple devices"
  exit 1
fi

brew install --cask git-credential-manager
git-credential-manager configure

#git config --global credential.helper manager
#git config --global credential.credentialStore secretservice

#echo "Installing libsecret..."
#./${helpersPath}/_installIfExists.sh libsecret

# Not sure if these are needed.
#./${helpersPath}/_installIfExists.sh gnome-keyring seahorse

echo "Done!"
