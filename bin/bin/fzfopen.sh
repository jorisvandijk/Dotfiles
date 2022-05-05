#!/usr/bin/env bash
#
# Script name: 	fzfopen.sh
# Author:		Joris van Dijk
# Author URL:	gitlab.com/jorisvandijk 
# License:		GNU General Public License v3.0
# 
# Dependencies: xdg-open, ripgrep, fzf, rofi
# Usage:		Run script
# Description: 	Open a file on your home system using rofi and fzf.

xdg-open "$(rg --no-messages --files --hidden ~/ \
    -g "!{*.srt,*.rar,*.txt,*.zip,*.nfo}" | rofi -threads 0 \
    -theme-str "#window { width: 900;}" \
    -dmenu -sort -sorting-method fzf -i -p "find")"
