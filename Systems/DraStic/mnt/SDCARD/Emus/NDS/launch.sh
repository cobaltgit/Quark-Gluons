#!/bin/sh

. /mnt/SDCARD/System/scripts/helpers.sh || . /mnt/SDCARD/System/bin/helpers.sh

EMU="$(echo "$1" | cut -d'/' -f5)"
GAME="$(basename "$1")"
EMU_DIR="/mnt/SDCARD/Emus/${EMU}"
OPT_DIR="/mnt/SDCARD/Emus/.emu_setup/opts"

OVERRIDE_FILE="/mnt/SDCARD/Emus/.emu_setup/overrides/$EMU/$GAME.opt"

[ -f "$OPT_DIR/$EMU.opt" ] && . "$OPT_DIR/$EMU.opt"
[ -f "$OVERRIDE_FILE" ] && . "$OVERRIDE_FILE"

export HOME="$EMU_DIR"
export PATH="$EMU_DIR:$PATH"
export LD_LIBRARY_PATH="$EMU_DIR/libs:$LD_LIBRARY_PATH"

SWAPPINESS=$(cat /proc/sys/vm/swappiness)
L2R2_COMBO=$(cat /sys/module/gpio_keys_polled/parameters/l2r2combokey)

# 60 by default
echo 10 > /proc/sys/vm/swappiness
echo 0 > /sys/module/gpio_keys_polled/parameters/l2r2combokey

if [ "$CPU_MODE" = "smart" ]; then
    { # speed up game launch
        set_cpuclock --mode performance
        sleep 5
        set_cpuclock --mode smart --min-freq $CPU_MIN_FREQ
    } &
else
    set_cpuclock --mode "$CPU_MODE"
fi

cd $EMU_DIR
if [ ! -f "/tmp/.show_hotkeys" ]; then
    touch /tmp/.show_hotkeys
    LD_LIBRARY_PATH=/usr/trimui/lib:$LD_LIBRARY_PATH ./show_hotkeys
fi

export SDL_VIDEODRIVER=mmiyoo
export SDL_AUDIODRIVER=mmiyoo
export EGL_VIDEODRIVER=mmiyoo

cd $EMU_DIR
./drastic "$1"
sync

echo $SWAPPINESS > /proc/sys/vm/swappiness
echo $L2R2_COMBO > /sys/module/gpio_keys_polled/parameters/l2r2combokey
