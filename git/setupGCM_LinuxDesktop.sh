#!/bin/bash
echo "Installing GCM from binary."

helpersPath="../helpers"
distroName=$(./${helpersPath}/_getDistro.sh)

git config --global credential.helper manager
git config --global credential.credentialStore secretservice

echo "Installing libsecret..."
./${helpersPath}/_installIfExists.sh libsecret

# Not sure if these are needed.
./${helpersPath}/_installIfExists.sh gnome-keyring seahorse

echo "Done!"
