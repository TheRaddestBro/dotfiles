#!/bin/bash

echo "Installing critical packages"
pacman -S --noconfirm eza tldr which

#echo "Setting up Homebrew..."
#pushd brew
#./setupBrew.sh
#popd
#eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

echo "Installing base packages..."
pacman -S --noconfirm btop dust fd fzf lazygit ripgrep stress

echo "Installing fun packages..."
#pushd helpers
# Pacman does hot have these. AUR Maybe?
#./_installIfExists.sh aptitude neofetch tmuxinator
pacman -S --noconfirm wget git cmake stow tmux zsh tree zip unzip powerline sysstat entr powertop
#popd
mkdir -p $HOME/.local/share
exit 0

echo "Upgrading all other packages..."
sudo nala upgrade -y

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
