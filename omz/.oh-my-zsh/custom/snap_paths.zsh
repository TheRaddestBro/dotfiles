# Add path so snaps still work
snapPath="/snap"
if [ -d "$snapPath" ]; then
	export PATH="$PATH:/snap/bin"
fi

