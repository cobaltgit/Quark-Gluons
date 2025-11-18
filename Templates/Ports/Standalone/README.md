## Template: Standalone Ports

This is a template framework for standalone (particularly SDL-based) ports for the TrimUI Smart. 

Replace the name "Your Port" in the launch script and data folder with the name of the port and fill in the `PORT_EXE` and `PORT_CMDLINE` variables as appropriate, relative to the data folder.

[!NOTE]
If the port data ships with additional dynamic libraries, export `LD_LIBRARY_PATH` in the script as needed with the directory containing them before launching the port.

**Example usage: OpenJazz port**
```sh
#!/bin/sh

#### BEGIN USER SECTION ####
PORT_EXE="OpenJazz" # executable file to run
PORT_CMDLINE="jazz1 jazzxmas" # CLI args to pass to port executable
#### END USER SECTION ####

PORT_HOME="$(dirname "$0")/.data/$(basename "$0" .sh)"

export HOME="$PORT_HOME"
export SDL_VIDEO_FBCON_ROTATION="CCW" # correct rotation for screen (240x320 -> 320x240) for SDL 1.2-based applications

cd "$PORT_HOME"

# do stuff here before launching the port

./$PORT_EXE $PORT_CMDLINE
```
