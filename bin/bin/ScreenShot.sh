#!/usr/bin/env bash
#
# Script name: 	ScreenShot.sh
# Author:		Joris van Dijk
# Author URL:	gitlab.com/jorisvandijk 
# License:		GNU General Public License v3.0
# 
# Dependencies: scrot, xclip
# Usage:		Run script
# Description: 	Take a screenshot, save to directory and copy to clipboard.

scrot ~/Pictures/ss/%Y-%m-%d-%T-screenshot.png -e 'xclip -selection clipboard -t image/png -i $f'
