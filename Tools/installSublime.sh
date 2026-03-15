helpersPath="../helpers"
distroName=$(${helpersPath}/_getDistro.sh)

echo "Installing Sublime Text"
if [[ "$distroName" == "debian" || "$distroName" == "ubuntu" ]]; then
  echo "Debian is not yet supported!"
  exit 1
elif [[ "$distroName" == "arch" ]]; then
  # Obtain the key
  echo "Obtaining the Sublime signing key..."
  curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg

  # Assuming x86-64 for now.
  echo "Selecting the appropriate channel..."
  echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf

  echo "Installing Sublime Text"
  sudo pacman -Syu --needed --noconfirm sublime-text

  echo "Installing Sublime Merge"
  sudo pacman -Syu --needed --noconfirm sublime-merge
fi
