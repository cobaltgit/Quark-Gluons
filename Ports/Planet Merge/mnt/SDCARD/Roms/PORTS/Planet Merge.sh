#!/bin/sh

PORT_HOME="$(dirname "$0")/.data/planetmerge"
export HOME="$PORT_HOME"

cd "$PORT_HOME"

export SDL_VIDEO_FBCON_ROTATION="CCW"
./planets