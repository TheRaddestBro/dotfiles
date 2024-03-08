#!/bin/bash
echo "Installing GCM for WSL"

echo "Installing necessary environment packages..."
if [ ! -f /usr/bin/nala ]; then
	echo "Installing nala. It's better than apt... Use it instead :)"
	sudo apt update && sudo apt install -y nala
fi

echo "Installing dotnet..."
sudo nala install -y --no-install-recommends libice6 libsm6 libfontconfig-dev

bash -c "$(curl -fsSL https://dot.net/v1/dotnet-install.sh)" "" --channel 7.0

source $HOME/.bash_profile

echo "Installing git-credential-manager (dotnet tool version)"
dotnet tool install --global git-credential-manager
git-credential-manager configure

# Somewhat secure default option.
# TODO: Figure out how to get gpg or libsecret working.
git config --global credential.credentialStore cache && git config --global credential.cacheOptions "--timeout 3600"

# Commenting this out for now. This seems to cause the GCM to prompt EVERY time it needs credentials.
# Essentially invalidaging the "cache" behavior we set above.
#git config --global credential.github.com.useHttpPath true

echo "Done!"
