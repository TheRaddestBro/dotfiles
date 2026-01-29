#!/bin/bash
#
# This script should be run via curl:
#   bash -c "$(curl -fsSL https://raw.githubusercontent.com/TheRaddestBro/dotfiles/main/install.sh)"
# or via wget:
#   bash -c "$(wget -qO- https://raw.githubusercontent.com/TheRaddestBro/dotfiles/main/install.sh)"
# or via fetch:
#   bash -c "$(fetch -o - https://raw.githubusercontent.com/TheRaddestBro/dotfiles/main/install.sh)"
#

distroName=$(curl -sS https://raw.githubusercontent.com/TheRaddestBro/dotfiles/main/helpers/_getDistro.sh | bash)

if [[ "$distroName" == "debian" || "$distroName" == "ubuntu" ]]; then
  sudo apt update && sudo apt install -y git
elif [[ "$distroName" == "arch" ]]; then
  pacman -Syu --noconfirm && pacman -S --noconfirm git
fi

echo "Cloning dotfiles into $HOME/.dotfiles"
git clone https://github.com/TheRaddestBro/dotfiles.git $HOME/.dotfiles
pushd $HOME/.dotfiles

if [[ "$distroName" == "debian" || "$distroName" == "ubuntu" ]]; then
  ./go.sh
elif [[ "$distroName" == "arch" ]]; then
  ./goArch.sh
fi

popd
