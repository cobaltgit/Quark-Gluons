#!/bin/sh

PORT_HOME="$(dirname "$0")/.data/ZeldaNSQ"
HOME="$PORT_HOME"

export SDL_VIDEO_FBCON_ROTATION="CCW"

cd "$PORT_HOME"

while true; do # in case of a crash
    ./evtest --query /dev/input/event0 EV_KEY 97
    if [ $? = 10 ]; then
        ./evtest --query /dev/input/event0 EV_KEY 28
        if [ $? = 10 ]; then
            killall -9 zelda_nsq
            break
        fi
    fi
    sleep 0.1
done &

./zelda_nsq
