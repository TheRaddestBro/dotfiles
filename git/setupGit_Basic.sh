#!/bin/bash

echo "Seting up Git..."
if [ -L $HOME/.gitconfig ]; then
  echo "There was already a .gitconfig symlink in $HOME. I'm going to leave it alone..."
else
  if [ -f .gitconfig ]; then
    echo "Removing local .gitconfig"
    rm .gitconfig
  fi

  if [ -f $HOME/.gitconfig ]; then
    echo "There was already a .gitconfig in $HOME. Fixing it up."
    mv $HOME/.gitconfig .gitconfig_OLD
    cp .gitconfig_OLD .gitconfig
  else
    cp .gitconfig_BASE .gitconfig
  fi
fi

echo "Want Beyond Compare integration? Run git/setupBC*.sh"

