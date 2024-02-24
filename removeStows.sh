#!/bin/bash

echo "Removing all stows from .dotfiles..."
stow --verbose=1 --delete --target=$HOME aliases bash git omz tmux tmuxinator vim 
echo "Done!"

