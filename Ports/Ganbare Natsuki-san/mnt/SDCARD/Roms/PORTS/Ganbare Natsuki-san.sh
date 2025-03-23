#!/bin/sh

PORT_HOME="$(dirname "$0")/.data/GNP"
HOME="$PORT_HOME

cd "$PORT_HOME"

$PORT_HOME/gnp.elf
