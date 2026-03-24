#!/bin/bash
echo "Installing GCM from binary."

helpersPath="../helpers"
distroName=$(./${helpersPath}/_getDistro.sh)

if [[ "$distroName" == "debian" || "$distroName" == "ubuntu" ]]; then
  versionString="2.7.3"
  latestURL="https://github.com/git-ecosystem/git-credential-manager/releases/latest/download"
  fileName="gcm-linux-x64-${versionString}.deb"
  #fileName="gcm-linux-arm64-${versionString}.deb"

  wget ${latestURL}/${fileName}
  sudo dpkg -i ${fileName}
else
  echo "${distroName} is not supported.. YET"
fi

git config --global credential.helper manager
git config --global credential.credentialStore secretservice

echo "Installing libsecret..."
./${helpersPath}/_installIfExists.sh libsecret

# Not sure if these are needed.
./${helpersPath}/_installIfExists.sh gnome-keyring seahorse

echo "Done!"
