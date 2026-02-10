# TheRaddestBro's .dotfiles

## Installation
Currently, this is tuned for a WSL Ubuntu setup.

* Install via one of these as non-root (Installing these dotfiles as a root user is unsupported. See below for the commands to setup a sudo user) 
  + ``bash -c "$(curl -fsSL https://raw.githubusercontent.com/TheRaddestBro/dotfiles/main/install.sh)"``
  + ``bash -c "$(wget -qO- https://raw.githubusercontent.com/TheRaddestBro/dotfiles/main/install.sh)"``
  + ``bash -c "$(fetch -o - https://raw.githubusercontent.com/TheRaddestBro/dotfiles/main/install.sh)"``
* Logout/Login. This will allow aliases to work, and let the powerlevel10k config script to run.
* Once that is done, other scripts can be run to customize/setup other things
  + Git
    * ``setupGCM_DotNet.sh`` Run this to install and setup a linux dotnet version of the GCM.
    * ``setupGCM_WSL_GFW.sh`` Run this to setup the Windows Git Credential Manager if using WSL.
    * ``setupBC5_WSL.sh`` This will set up Beyond Compare 5 as your git difftool.
    * ``setupBasic.sh`` This is run as part of the go.sh script, and will link a default sane .gitconfig into your home folder.
  + Neovim
    * Choose one:
      + ``setupLazyVim.sh`` Run this to setup LazyVim.
      + ``setupNeovimStarter.sh`` Run this to setup basic Neovim, with only the official kickstart.nvim added.
      + ``setupNvChad.sh`` Run this to setup NvChad if you're a chad.
    * Then: ``setupNvimAlternatives.sh`` Run this to alias `vi` and `vim` to `nvim`
* ``removeStows.sh`` can be used to basically uninstall these dotfiles.

# Setup Sudo user
- Arch
  * ``useradd -m user_name && passwd user_name``
  * ``pacman -Sy --noconfirm sudo vi && usermod -aG wheel user_name``
  * Uncomment the %wheel ALL=(ALL) ALL line in /etc/sudoers using visudo
  * For WSL, do one of the following
    + Change WSL default user
      * Exit the window, then in PowerShell enter: ``wsl --manage distro_name --set-default-user user_name``
    + Change the default login user in ``/etc/wsl.conf`` by appending:
      * ``[user]`` 
      * ``default=user_name`` 
  * Login as user_name
  * now run the ``install.sh`` script.

## List of installed Tools/Utilities/Packages in this setup.
- TODO: 


## Notices
All content and source code for this package are written by, and exclusively belong to TheRaddestBro.

## Support
None yet

