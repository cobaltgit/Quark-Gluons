#!/bin/sh

PORT_HOME="$(dirname "$0")/.data/overheated"
HOME="$PORT_HOME"

export SDL_VIDEO_FBCON_ROTATION="CCW"

cd "$PORT_HOME"

./game.elf
