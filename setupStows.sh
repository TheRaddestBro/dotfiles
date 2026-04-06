#!/bin/bash

# Ensure the $HOME/.config folder exists so stow doesn't try to link the entire thing.
# This helps with other stows wanting to put things in this same folder tree.
mkdir -p $HOME/.config/


function renameOldFile {
  local file=$1
  local oldFileName=${file}_OLD

  if [ -L ${file} ]; then
    echo "${file} already existed as a symlink. I'm going to leave it alone..."
    return 0
  fi
  
  if [ -f ${file} ]; then
    echo "${file} already existed. Renaming to ${oldFileName} just in case you might need it."
    mv ${file} ${oldFileName}
  fi
  
  return 0
}

# If any of these files already existed, rename them so they aren't totally list in case of a fire or whatever.
renameOldFile "${HOME}/.bash_profile"
renameOldFile "${HOME}/.gitconfig"

./_justTheStows.sh

# use this to ignore changes to the .gitconfig file. Useful because there will always be different changes for this file based on the environment.
#git update-index --assume-unchanged git/.gitconfig

echo "Adding a line to ~/.bashrc to execute our extra stuff..."
echo -e "if [ -f $HOME/.bashrc_plus ]; then\n\tsource $HOME/.bashrc_plus\nfi\n" >>$HOME/.bashrc

echo "Done!"
