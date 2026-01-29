#!/bin/bash

if [ ! -f $(which stow) ]; then
  echo "Installing stow, this will be used to manage the symlinks to the dotfiles dir..."
  ./helpers/_installIfExists.sh stow
fi

# Make subfolders so we can ensure we don't stow the parent folders we don't want.
mkdir -p $HOME/.config/tmuxinator

# Ignore anything that starts with setup, or ends with _OLD, _NEW, etc.
ignorePattern="^setup.*\.sh|.*_OLD$|.*_NEW$|.*_BASE$"
echo "Installing symlinks for .dotfiles into the $HOME folder..."
stow --verbose=1 --ignore=$ignorePattern --target=$HOME aliases bash git omz tmux tmuxinator vim

echo "Done!"
