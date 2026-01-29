#!/bin/bash
#
# This script should be run via curl:
#   bash -c "$(curl -fsSL https://raw.githubusercontent.com/TheRaddestBro/dotfiles/main/install.sh)"
# or via wget:
#   bash -c "$(wget -qO- https://raw.githubusercontent.com/TheRaddestBro/dotfiles/main/install.sh)"
# or via fetch:
#   bash -c "$(fetch -o - https://raw.githubusercontent.com/TheRaddestBro/dotfiles/main/install.sh)"
#

./helpers/_installIfExists.sh git

echo "Cloning dotfiles into $HOME/.dotfiles"
git clone https://github.com/TheRaddestBro/dotfiles.git $HOME/.dotfiles
pushd $HOME/.dotfiles

if [[ "$distroName" == "debian" || "$distroName" == "ubuntu" ]]; then
  ./go.sh
elif [[ "$distroName" == "arch" ]]; then
  ./goArch.sh
fi

popd
