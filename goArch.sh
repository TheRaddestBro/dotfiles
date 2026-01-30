#!/bin/bash

if [[ "$(whoami)" == "root" ]]; then
  echo "It's not a good idea to install everything as root. Go make a sudo user!"
  exit 1
fi

echo "Installing critical packages"
./helpers/_installIfExists.sh eza tldr which

echo "Installing base packages..."
./helpers/_installIfExists.sh btop dust fd fzf lazygit ripgrep stress vim

echo "Installing fun packages..."
# Pacman does hot have these. AUR Maybe?
#./_installIfExists.sh aptitude neofetch tmuxinator
./helpers/_installIfExists.sh wget git cmake stow tmux zsh tree zip unzip powerline sysstat entr powertop
mkdir -p $HOME/.local/share

echo "Upgrading all other packages..."
sudo pacman -Syu --noconfirm

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/g' $HOME/.zshrc
# TODO: Add more OMZ plugins. (sublime sublime-merge themes vscode)
sed -i 's/plugins=\(.*\)/plugins=(battery git tmux tmuxinator)/g' $HOME/.zshrc

echo "Making zsh the default shell (You might need to provide credentials for this)..."
sudo chsh -s $(which zsh) $(whoami)

echo "Setting up the rest of the dotfiles..."
./setupStows.sh

echo "Updating tldr results..."
tldr -u

echo "Done! Now, you can run logout/login and configure the powerlevel10k theme. Happy typing!"
