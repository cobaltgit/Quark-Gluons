#!/bin/sh

PORT_HOME="$(dirname "$0")/.data/OpenJazz"
HOME="$PORT_HOME"

cd "$PORT_HOME"

export SDL_VIDEO_FBCON_ROTATION="CCW"

while true; do
    ./evtest --query /dev/input/event0 EV_KEY 97
    if [ $? = 10 ]; then
        ./evtest --query /dev/input/event0 EV_KEY 28
        if [ $? = 10 ]; then
            killall OpenJazz
            break
        fi
    fi
    sleep 0.1
done &

./OpenJazz jazz jazzxmas
