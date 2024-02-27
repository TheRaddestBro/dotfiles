#!/bin/bash
echo "Installing Lazyvim"

echo "Installing necessary environment packages..."
if [ ! -f /usr/bin/nala ]; then
	echo "Installing nala. It's better than apt... Use it instead :)"
	sudo apt update && sudo apt install -y nala
fi

echo "Installing dependencies"
sudo nala install -y ripgrep build-essential fd-find zip unzip
sudo snap install lazygit

echo "Installing neovim"
sudo snap install nvim --classic

echo "Backing up old nvim setup"
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

# Install the LazyVim starter
git clone https://github.com/LazyVim/starter ~/.config/nvim

# Remove the git folder, so it can be added to my own custom repo maybe
rm -rf ~/.config/nvim/.git

echo "Done!"

