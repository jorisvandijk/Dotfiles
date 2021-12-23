#!/usr/bin/env bash

CHECK=NAME
NAME=$1
WORKSPACE=$2

if [ $1 == firefox ]; then
    CHECK=GeckoMain
fi

if [ $1 == libreoffice ]; then
    CHECK=asoffice.bin
fi

if [ $1 == newsboat ]; then
    CHECK=newsboat
    NAME="kitty --hold --detach --class newsboat -e newsboat"
fi

i3-msg workspace $WORKSPACE
# notify-send -t 1500 "Workspace $WORKSPACE : ${NAME^}"
if ! pgrep -x "$CHECK" > /dev/null; then
    $NAME
fi