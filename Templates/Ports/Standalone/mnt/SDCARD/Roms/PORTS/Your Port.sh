#!/bin/sh

#### BEGIN USER SECTION ####
PORT_EXE="" # executable file to run
PORT_CMDLINE="" # CLI args to pass to port executable
#### END USER SECTION ####

PORT_HOME="$(dirname "$0")/.data/$(basename "$0" .sh)"

export HOME="$PORT_HOME"
export SDL_VIDEO_FBCON_ROTATION="CCW" # correct rotation for screen (240x320 -> 320x240) for SDL 1.2-based applications

cd "$PORT_HOME"

# do stuff here before launching the port

./$PORT_EXE $PORT_CMDLINE
