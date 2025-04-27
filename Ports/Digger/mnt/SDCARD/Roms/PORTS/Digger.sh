#!/bin/sh

PORT_HOME="$(dirname "$0")/.data/Digger"
HOME="$PORT_HOME"

cd "$PORT_HOME"

export SDL_VIDEO_FBCON_ROTATION="CCW"

./digger