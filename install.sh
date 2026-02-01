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
  sudo pacman -Syu --noconfirm && sudo pacman -S --needed --noconfirm base-devel git

fi

if [[ "$(whoami)" == "root" ]]; then
  echo "It's not a good idea to install everything as root. Go make a sudo user, and try again! (Check the readme at https://github.com/TheRaddestBro/dotfiles for details)"
  exit 1
fi

if [[ "$distroName" == "arch" ]]; then
  # Install AUR wrapper
  git clone https://aur.archlinux.org/yay.git
  pushd yay
  makepkg -si --noconfirm
  popd
  sudo rm -r yay
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
