## Template: Standalone Ports

This is a template framework for libretro-based ports for the TrimUI Smart. 

Replace the name "Your Port" in the launch script and data folder with the name of the port and fill in the `PORT_LR_CORE` and `PORT_LR_CONTENT` variables as appropriate, relative to the data folder.

**Example usage: Cave Story port**
```sh
#!/bin/sh

#### BEGIN USER SECTION ####
PORT_LR_CORE="nxengine_libretro.so" # libretro core to run
PORT_LR_CONTENT="Doukutsu.exe" # Content to load libretro core with. Some cores (i.e. Mr.Boom, xrick) may be contentless.
#### END USER SECTION ####

PORT_HOME="$(dirname "$0")/.data/$(basename "$0" .sh)"
RETROARCH_DIR="/mnt/SDCARD/RetroArch"
[ "$PORT_LR_CONTENT" != "" ] && PORT_LR_CONTENT_FULLPATH="$PORT_HOME/$PORT_LR_CONTENT" # for contentless cores

cd "$RETROARCH_DIR"

cp -f "retroarch.cfg" "retroarch_sdl.cfg"

HOME="$RETROARCH_DIR" "$RETROARCH_DIR/ra32.trimui_sdl" -v $NET_PARAM -L "$PORT_HOME/$PORT_LR_CORE" "$PORT_LR_CONTENT_FULLPATH"

cp -f "retroarch_sdl.cfg" "retroarch.cfg"
```
