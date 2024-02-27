#!/bin/bash
echo "Setting up nvim as an alternative for vi and vim"

CUSTOM_NVIM_PATH=~/.dotfiles/nvim/startNvim.sh

sudo update-alternatives --install /usr/bin/vi vi ${CUSTOM_NVIM_PATH} 60
sudo update-alternatives --install /usr/bin/vim vim ${CUSTOM_NVIM_PATH} 60

# The stackoverflow also had these, but this seems to work without them. Omitting for now.
#sudo update-alternatives --set vi "${CUSTOM_NVIM_PATH}"
#sudo update-alternatives --set vim "${CUSTOM_NVIM_PATH}"

echo "Done!"
