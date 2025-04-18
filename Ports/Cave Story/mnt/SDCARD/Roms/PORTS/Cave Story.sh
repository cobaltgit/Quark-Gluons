#!/bin/sh

PORT_HOME="$(dirname "$0")/.data/Doukutsu"
RETROARCH_DIR="/mnt/SDCARD/RetroArch"
RETROARCH_CORE="$PORT_HOME/nxengine_libretro.so"
GAME_FILE="$PORT_HOME/Doukutsu.exe"

cd "$RETROARCH_DIR"

cp -f "retroarch.cfg" "retroarch_sdl.cfg"

HOME="$RETROARCH_DIR" "$RETROARCH_DIR/ra32.trimui_sdl" -v -L "$RETROARCH_CORE" "$GAME_FILE"

cp -f "retroarch_sdl.cfg" "retroarch.cfg"
