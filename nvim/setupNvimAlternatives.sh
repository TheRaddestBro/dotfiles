#!/bin/bash
echo "Setting up nvim as an alternative for vi and vim"

CUSTOM_NVIM_PATH=~/.dotfiles/nvim/startNvim.sh

if [[ "$distroName" == "debian" || "$distroName" == "ubuntu" ]]; then
  sudo update-alternatives --install /usr/bin/vi vi ${CUSTOM_NVIM_PATH} 60
  sudo update-alternatives --install /usr/bin/vim vim ${CUSTOM_NVIM_PATH} 60
elif [[ "$distroName" == "arch" ]]; then
  echo "Arch does not support update-alternatives. The .aliases file will be responsible for making vi = nvim"
fi

# The stackoverflow also had these, but this seems to work without them. Omitting for now.
#sudo update-alternatives --set vi "${CUSTOM_NVIM_PATH}"
#sudo update-alternatives --set vim "${CUSTOM_NVIM_PATH}"

echo "Done!"
