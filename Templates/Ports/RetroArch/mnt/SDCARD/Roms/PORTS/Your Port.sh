#!/bin/sh

#### BEGIN USER SECTION ####
PORT_LR_CORE="" # libretro core to run
PORT_LR_CONTENT="" # Content to load libretro core with. Some cores (i.e. Mr.Boom, xrick) may be contentless.
#### END USER SECTION ####

PORT_HOME="$(dirname "$0")/.data/$(basename "$0" .sh)"
RETROARCH_DIR="/mnt/SDCARD/RetroArch"
[ "$PORT_LR_CONTENT" != "" ] && PORT_LR_CONTENT_FULLPATH="$PORT_HOME/$PORT_LR_CONTENT" # for contentless cores

export HOME="$RETROARCH_DIR"

cd "$PORT_HOME"

cp -f "retroarch.cfg" "retroarch_sdl.cfg"

HOME="$RETROARCH_DIR" "$RETROARCH_DIR/ra32.trimui_sdl" -v $NET_PARAM -L "$PORT_HOME/$PORT_LR_CORE" "$PORT_LR_CONTENT_FULLPATH"

cp -f "retroarch_sdl.cfg" "retroarch.cfg"
