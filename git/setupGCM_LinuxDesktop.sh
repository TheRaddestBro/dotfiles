#!/bin/bash
echo "Installing GCM from binary."

git config --global credential.helper manager
git config --global credential.credentialStore secretservice

echo "Installing libsecret..."
./helpers/_installIfExists.sh libsecret

# Not sure if these are needed.
./helpers/_installIfExists.sh gnome-keyring seahorse

echo "Done!"
