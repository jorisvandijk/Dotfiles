#!/usr/bin/env bash
#
# Script name: 	ConjureApplication.sh 
# Author:	Joris van Dijk
# Author URL:	gitlab.com/jorisvandijk 
# License:	GNU General Public License v3.0
# 
# Dependencies: wmctrl, fzf
# Usage:	Run script
# Description: 	Pull the selected application to current workspace.

wmctrl -i -R $(wmctrl -l | fzf | cut -d\  -f1)
