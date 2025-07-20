#!/bin/sh

PORT_HOME="$(dirname "$0")/.data/dinojump"
export HOME="$PORT_HOME"

cd "$PORT_HOME"

export SDL_VIDEO_FBCON_ROTATION="CCW"
./dino_jump > /mnt/SDCARD/dino.log 2>&1
