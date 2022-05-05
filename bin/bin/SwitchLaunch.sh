#!/usr/bin/env bash
#
# Script name: 	SwitchLaunch.sh
# Author: 		Joris van Dijk
# Author URL:	gitlab.com/jorisvandijk 
# License:		GNU General Public License v3.0
# 
# Dependencies: i3, wmctrl, kitty
# Usage: 		SwitchLaunch.sh <application name>
# Description: 	Launch an application if it is not running, or else switch to it.

i3-msg workspace "${1^}"

if [ $1 == newsboat ]; then
    wmctrl -x -a "mpv" || wmctrl -x -a "$1" || kitty --hold --detach --class newsboat -e newsboat
else
    wmctrl -x -a "$1" || $1
fi
