#!/bin/bash

echo "Ensuring dependencies are available..."
if [ ! -f /usr/bin/nala ]; then
  echo "Installing nala. It's superior to apt in every way. Use it instead! :)"
  sudo apt update && sudo apt install -y nala
fi

echo "Adding Beyond Compare as the git difftool..."

# So I don't have to keep typing it...
gcf="git config --global --replace-all"

# WSL-ify the Beyond Compare 4 path.
bcPath=$(wslpath -au "c:\Program Files\Beyond Compare 5\bcomp.exe")

# Fix spaces!
bcPathFixed=$(echo "$bcPath" | sed -e 's/ /\\ /g')

# Doing this because all of the spaces, quotes and escaping of '$' is annoying.
bcLocal="\$(wslpath -aw \$LOCAL)"
bcRemote="\$(wslpath -aw \$REMOTE)"
bcBase="\$(wslpath -aw \$BASE)"
bcMerged="\$(wslpath -aw \$MERGED)"
bcDiffCmd="$bcPathFixed "$bcLocal" "$bcRemote""
bcMergeCmd="$bcPathFixed "$bcLocal" "$bcRemote" "$bcBase" "$bcMerged""

echo "Beyond Compare found at: $bcPath"
echo "Fixing spaces so Windows is happy: $bcPathFixed"

# Disabling symlinks across the board feels wrong. The only reason to do this
# is for the difftool to work properly in WSL. It's probably easier to just fix
# the alias for git difftool to always pass --no-symlinks
#$gcf core.symlinks false

$gcf diff.tool bc
$gcf difftool.prompt false
$gcf difftool.bc.path "$bcPathFixed"
$gcf difftool.bc.cmd "$bcDiffCmd"

$gcf merge.tool bc
$gcf mergetool.prompt false
$gcf mergetool.bc.path "$bcPathFixed"
$gcf mergetool.bc.cmd "$bcMergeCmd"

echo "Done!"
