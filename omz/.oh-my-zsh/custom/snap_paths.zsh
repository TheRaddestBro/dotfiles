# Add path so snaps still work
if [ -d /snap ]; then
	export PATH="$PATH:/snap/bin"
fi

