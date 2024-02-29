#!/bin/bash

echo "Ensuring dependencies are available..."
if [ ! -f /usr/bin/nala ]; then
	echo "Installing nala. It's superior to apt in every way. Use it instead! :)"
	sudo apt update && sudo apt install -y nala
fi

if [ ! -f /usr/bin/stow ]; then
	echo "Installing stow, this will be used to manage the symlinks to the dotfiles dir..."
	sudo nala update && sudo nala install -y --no-install-recommends stow
fi

# Ensure the $HOME/.config folder exists so stow doesn't try to link the entire thing.
# This helps with other stows wanting to put things in this same folder tree.
mkdir -p $HOME/.config/

# Git needs some special attention, as the ~/.gitconfig might already exist, and we don't want to overwrite it.
pushd git
./setupGit_Basic.sh
popd

# Tmuxinator needs some extra attention. We need to ensure the $HOME/.config/tmuxinator folder is already existing.
mkdir -p $HOME/.config/tmuxinator

# Ignore anything that starts with setup, or ends with _OLD, _NEW, etc.
ignorePattern="^setup.*\.sh|.*_OLD$|.*_NEW$|.*_BASE$"
echo "Installing symlinks for .dotfiles into the $HOME folder..."
stow --verbose=1 --ignore=$ignorePattern --target=$HOME aliases bash git omz tmux tmuxinator vim

echo "Adding a line to ~/.bashrc to execute our extra stuff..."
echo -e "if [ -f $HOME/.bashrc_plus ]; then\n\tsource $HOME/.bashrc_plus\nfi\n" >>$HOME/.bashrc

echo "Done!"
