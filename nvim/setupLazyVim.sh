#!/bin/bash
echo "Installing Lazyvim"

helpersPath=$(dirname "../helpers")
distroName=$(./${helpersPath}/_getDistro.sh)
exit 0
echo "Installing dependencies"
./${helpersPath}/_installIfExists.sh nodejs

echo "Installing neovim"
if [[ "$distroName" == "debian" || "$distroName" == "ubuntu" ]]; then
  brew install nvim
elif [[ "$distroName" == "arch" ]]; then
  ./${helpersPath}/_installIfExists.sh neovim
fi

echo "Backing up old nvim setup"
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

# Install the LazyVim starter
git clone https://github.com/LazyVim/starter ~/.config/nvim

# We need to ensure the $HOME/.config/nvim/lua/plugins folder is already existing.
mkdir -p $HOME/.config/nvim/lua/plugins

# Remove the git folder, so it can be added to my own custom repo maybe
rm -rf ~/.config/nvim/.git
rm -rf ~/.config/nvim/.github

ignorePattern="^setup.*\.sh|.*_OLD$|.*_NEW$|.*_BASE$"
echo "Installing symlinks for .dotfiles into the $HOME folder..."
stow --verbose=1 --ignore=$ignorePattern --target=$HOME lazyvim

echo "Done!"
