#!/bin/bash
echo "Installing NVChad"

helpersPath=$(dirname "$0")
distroName=$(./${helpersPath}/_getDistro.sh)

echo "Installing dependencies"
./helpers/_installIfExists.sh nodejs

echo "Installing neovim"
if [[ "$distroName" == "debian" || "$distroName" == "ubuntu" ]]; then
  brew install lazygit nvim
elif [[ "$distroName" == "arch" ]]; then
  ./helpers/_installIfExists.sh lazygit neovim
fi

echo "Backing up old nvim setup"
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

# Install the NVChad starter
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && $(NVCHAD_EXAMPLE_CONFIG=y nvim --headless "+q")

# TODO: We need to ensure the config folder is available, so we don't stow the wrong thing
#mkdir -p $HOME/.config/nvim/lua/plugins

# Remove the git folder, so it can be added to my own custom repo maybe
rm -rf ~/.config/nvim/.git
rm -rf ~/.config/nvim/.github

# TODO: Fill this out the next time I actually try out NvChad
#ignorePattern="^setup.*\.sh|.*_OLD$|.*_NEW$|.*_BASE$"
#echo "Installing symlinks for .dotfiles into the $HOME folder..."
#stow --verbose=1 --ignore=$ignorePattern --target=$HOME nvChad

echo "Done!"
