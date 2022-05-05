#!/usr/bin/env bash
#
# Script name: 	git.sh
# Author:		Joris van Dijk
# Author URL:	gitlab.com/jorisvandijk 
# License:		GNU General Public License v3.0
# 
# Dependencies: i3, jq
# Usage:		Run script
# Description: 	Dispays the name of the current workspace in i3.

notify-send -u normal -t 5000 "$(
	printf "Workspace: "
	i3-msg -t get_workspaces \
  	| jq '.[] | select(.focused==true).name' \
  	| cut -d"\"" -f2
)"
