#!/bin/bash
echo "Installing GCM for WSL"

echo "Installing necessary environment packages..."
if [ ! -f /usr/bin/nala ]; then
	echo "Installing nala. It's better than apt... Use it instead :)"
	sudo apt update && sudo apt install -y nala
fi

echo "Installing dotnet..."
sudo nala install -y --no-install-recommends dotnet7 libice6 libsm6 libfontconfig-dev

# Should only need to do this if basic dotfiles are not already installed.
echo -e "# Add .NET Core SDK tools\nexport PATH=\"\$PATH:/$HOME/.dotnet/tools\"\n" >> $HOME/.bash_profile
source $HOME/.bash_profile

echo "Installing git-credential-manager (dotnet tool version)"
dotnet tool install --global git-credential-manager
git-credential-manager configure

git config --global credential.credentialStore cache && git config --global credential.cacheOptions "--timeout 3600"

echo "Done!"

