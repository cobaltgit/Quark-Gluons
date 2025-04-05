#!/bin/sh

PORT_HOME="$(dirname "$0")/.data/XRick"
RETROARCH_DIR="/mnt/SDCARD/RetroArch"
RETROARCH_CORE="$PORT_HOME/xrick_libretro.so"

cd "$RETROARCH_DIR"

cp -f "retroarch.cfg" "retroarch_sdl.cfg"

HOME="$RETROARCH_DIR" "$RETROARCH_DIR/ra32.trimui_sdl" -v $NET_PARAM -L "$RETROARCH_CORE"

cp -f "retroarch_sdl.cfg" "retroarch.cfg"