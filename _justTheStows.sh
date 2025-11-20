#!/bin/bash

echo "Ensuring dependencies are available for stows..."
if [ ! -f /usr/bin/nala ]; then
  echo "Installing nala. It's superior to apt in every way. Use it instead! :)"
  sudo apt update && sudo apt install -y nala
fi

if [ ! -f /usr/bin/stow ]; then
  echo "Installing stow, this will be used to manage the symlinks to the dotfiles dir..."
  sudo nala update && sudo nala install -y --no-install-recommends stow
fi

# Make subfolders so we can ensure we don't stow the parent folders we don't want.
mkdir -p $HOME/.config/tmuxinator

# Ignore anything that starts with setup, or ends with _OLD, _NEW, etc.
ignorePattern="^setup.*\.sh|.*_OLD$|.*_NEW$|.*_BASE$"
echo "Installing symlinks for .dotfiles into the $HOME folder..."
stow --verbose=1 --ignore=$ignorePattern --target=$HOME aliases bash git omz tmux tmuxinator vim

echo "Done!"
