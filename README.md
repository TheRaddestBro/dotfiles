# TheRaddestBro's .dotfiles

## Installation
Currently, this is tuned for a WSL Ubuntu setup.

* Install via one of these (This will clone the repo for you).
  + ``bash -c "$(curl -fsSL https://raw.githubusercontent.com/TheRaddestBro/dotfiles/main/install.sh)"``
  + ``bash -c "$(wget -qO- https://raw.githubusercontent.com/TheRaddestBro/dotfiles/main/install.sh)"``
  + ``bash -c "$(fetch -o - https://raw.githubusercontent.com/TheRaddestBro/dotfiles/main/install.sh)"``
* Logout/Login. This will allow aliases to work, and let the powerlevel10k config script to run.
* Once that is done, other scripts can be run to customize/setup other things
  + Git
    * ``setupGit_GCM_WSL.sh`` Run this to setup the dotnet version of Git Credential Manager.
    * ``setupGit_BC_WSL.sh`` This will set up Beyond Compare as your git difftool.
  + Neovim
    * Choose one:
      + ``setupLazyVim.sh`` Run this to setup LazyVim.
      + ``setupNeovimStarter.sh`` Run this to setup basic Neovim, with only the official kickstart.nvim added.
      + ``setupNvChad.sh`` Run this to setup NvChad if you're a chad.
    * Then: ``setupNvimAlternatives.sh`` Run this to alias `vi` and `vim` to `nvim`
* ``removeStows.sh`` can be used to basically uninstall these dotfiles.

## List of installed Tools/Utilities/Packages in this setup.
- TODO: 

## Notices
All content and source code for this package are written by, and exclusively belong to TheRaddestBro.

## Support
None yet

