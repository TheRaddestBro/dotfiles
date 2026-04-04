#!/bin/bash

if [[ "$(whoami)" == "root" ]]; then
  echo "It's not a good idea to install everything as root. Go make a sudo user!"
  exit 1
fi

helpersPath="helpers"
distroName=$(${helpersPath}/_getDistro.sh)

if [[ "$distroName" != "fedora" ]]; then
  echo "You should only run this script from a fedora-based distro!"
fi


echo "Ensuring dependencies are available..."
echo "Installing dependencies"
${helpersPath}/_installIfExists.sh curl

echo "Setting up Homebrew..."
./brew/setupBrew.sh
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"

#echo >> /home/rohun/.bashrc
#echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"' >> /home/rohun/.bashrc

echo "Installing Homebrew packages..."
brew install btop dust eza fastfetch fd fzf lazygit ripgrep stress tldr 

# Install COPR repos
echo "Setting up COPR repos" 
sudo dnf install -y dnf-plugins-core
#sudo dnf copr enable atim/lazygit

echo "Installing RPM packages..."
./${helpersPath}/_installIfExists.sh cmake entr powerline powertop stow sysstat tmuxinator tree unzip zsh zip

mkdir -p $HOME/.local/share
exit 1

echo "Upgrading all other packages..."
sudo dnf upgrade --assumeyes 

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
