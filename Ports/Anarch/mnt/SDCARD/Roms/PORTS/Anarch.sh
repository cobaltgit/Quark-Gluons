#!/bin/sh

PORT_HOME="$(dirname "$0")/.data/Anarch"

cd "$PORT_HOME"

export SDL_VIDEO_FBCON_ROTATION="CCW"

./anarch