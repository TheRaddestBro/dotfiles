#!/bin/bash
echo "Installing Neovim plus Kickstart"

helpersPath="../helpers"
distroName=$(${helpersPath}/_getDistro.sh)

echo "Installing dependencies"
${helpersPath}/_installIfExists.sh nodejs build-essential

echo "Installing neovim"
if [[ "$distroName" == "debian" || "$distroName" == "ubuntu" ]]; then
  brew install nvim
elif [[ "$distroName" == "arch" ]]; then
  ${helpersPath}/_installIfExists.sh base-devel neovim
fi

echo "Backing up old nvim setup"
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

# Install the Official Neovim kickstarter
git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

# TODO: We need to ensure the config folder is available, so we don't stow the wrong thing
mkdir -p $HOME/.config/nvim/lua/custom/plugins

# Remove the git folder, so it can be added to my own custom repo maybe
rm -rf ~/.config/nvim/.git
rm -rf ~/.config/nvim/.github

# TODO: Fill this out the next time I actually try out the NV Starter
ignorePattern="^setup.*\.sh|.*_OLD$|.*_NEW$|.*_BASE$"
echo "Installing symlinks for .dotfiles into the $HOME folder..."
stow --verbose=1 --ignore=$ignorePattern --target=$HOME kickstart

echo "Done!"
