#!/bin/bash

# Ensure the $HOME/.config/tmuxinator folder exists so stow doesn't try to link the entire thing. 
# This helps with other stows wanting to put things in this same folder tree.
mkdir -p $HOME/.config/tmuxinator


