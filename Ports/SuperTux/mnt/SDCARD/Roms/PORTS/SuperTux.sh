#!/bin/sh

PORT_HOME="$(dirname "$0")/.data/SuperTux"
HOME="$PORT_HOME"

export SDL_VIDEO_FBCON_ROTATION="CCW"

cd "$PORT_HOME"

./supertux
