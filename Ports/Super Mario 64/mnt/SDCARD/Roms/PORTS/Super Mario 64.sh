#!/bin/sh

PORT_HOME="$(dirname "$0")/.data/SM64"
HOME="$PORT_HOME"

cd "$PORT_HOME"

if [ ! -f sm64.us.f3dex2e ]; then
	if [ ! -f baserom.us.z64 ]; then
		./printstr "   Missing baserom.us.z64   "
		exit 1
	fi
	md5sum -c md5rom.txt
	if [ $? -ne 0 ]; then
		./printstr "   Bad MD5 baserom.us.z64   "
		exit 1
	fi
	./printstr "   Applying diff patch   "
	./binenc sm64.bsdiff.enc sm64.bsdiff baserom.us.z64
	md5sum -c md5diff.txt
	if [ $? -ne 0 ]; then
		./printstr "   Failed to decrypt diff   "
		rm -f sm64.bsdiff
		exit 1
	fi
	./bspatch baserom.us.z64 sm64.us.f3dex2e sm64.bsdiff
	md5sum -c md5bin.txt
	if [ $? -ne 0 ]; then
		./printstr "   Failed to patch   "
		rm -f sm64.us.f3dex2e
		exit 1
	fi
fi

$PORT_HOME/sm64.us.f3dex2e
sync
