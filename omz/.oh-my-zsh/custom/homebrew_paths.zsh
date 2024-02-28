# Add path so homebrew works
set brewPath="/home/linuxbrew/.linuxbrew/bin"
if [ -d $brewPath ]; then
  export HOMEBREW_NO_ANALYTICS=1
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

