#!/bin/sh
# This script dispays the name of the current workspace in i3
# This script requires "jq" to function.
notify-send -u normal -t 5000 "$(
	printf "Workspace: "
	i3-msg -t get_workspaces \
  	| jq '.[] | select(.focused==true).name' \
  	| cut -d"\"" -f2
)"
