#!/bin/bash
#
# This script should be run via curl:
#   bash -c "$(curl -fsSL https://raw.githubusercontent.com/TheRaddestBro/dotfiles/main/installArch.sh)"
# or via wget:
#   bash -c "$(wget -qO- https://raw.githubusercontent.com/TheRaddestBro/dotfiles/main/installArch.sh)"
# or via fetch:
#   bash -c "$(fetch -o - https://raw.githubusercontent.com/TheRaddestBro/dotfiles/main/installArch.sh)"
#

pacman -Syu --noconfirm
pacman -S --noconfirm git

echo "Cloning dotfiles into $HOME/.dotfiles"
git clone https://github.com/TheRaddestBro/dotfiles.git $HOME/.dotfiles
pushd $HOME/.dotfiles
./goArch.sh
popd
