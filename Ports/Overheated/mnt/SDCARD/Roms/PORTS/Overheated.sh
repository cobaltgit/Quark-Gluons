#!/bin/sh

PORT_HOME="$(dirname "$0")/.data/overheated"
HOME="$PORT_HOME"

export SDL_VIDEO_FBCON_ROTATION="CCW"

cd "$PORT_HOME"

while true; do
    ./evtest --query /dev/input/event0 EV_KEY 97
    if [ $? = 10 ]; then
        ./evtest --query /dev/input/event0 EV_KEY 28
        if [ $? = 10 ]; then
            killall -9 game.elf
            break
        fi
    fi
    sleep 0.1
done &

./game.elf
