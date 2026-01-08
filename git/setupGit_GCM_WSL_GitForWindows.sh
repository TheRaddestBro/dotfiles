#!/bin/bash
echo "Installing GCM for WSL using the Git for Windows credeential manager"

git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager.exe"

echo "Done!"
