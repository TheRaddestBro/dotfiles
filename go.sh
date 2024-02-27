#!/bin/bash

echo "Ensuring dependencies are available..."
if [ ! -f /usr/bin/nala ]; then
	echo "Installing nala. It's superior to apt in every way. Use it instead! :)"
	sudo apt update && sudo apt install -y --no-install-recommends --show-progress nala
fi

echo "Installing basic packages..."
sudo snap install btop tldr && sudo snap refresh && sudo nala update && sudo nala install -y --no-install-recommends curl wget aptitude neofetch stress s-tui git cmake stow tmux zsh tree zip powerline tmuxinator sysstat
mkdir -p $HOME/.local/share

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

echo "Updating tldr results. For some reason this is not done on install..."
#tldr -u

echo "Done! Now, you can run logout/login and configure the powerlevel10k theme. Happy typing!"

