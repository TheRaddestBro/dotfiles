#!/bin/bash

# Ensure the $HOME/.config folder exists so stow doesn't try to link the entire thing.
# This helps with other stows wanting to put things in this same folder tree.
mkdir -p $HOME/.config/

# Git needs some special attention, as the ~/.gitconfig might already exist, and we don't want to overwrite it.
pushd git
./setupGit_Basic.sh
popd

./_justTheStows.sh

echo "Adding a line to ~/.bashrc to execute our extra stuff..."
echo -e "if [ -f $HOME/.bashrc_plus ]; then\n\tsource $HOME/.bashrc_plus\nfi\n" >>$HOME/.bashrc

echo "Done!"
