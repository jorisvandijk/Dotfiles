#!/bin/sh

handle_file() {
	if [ -d "$1" ]; then
		cd "$1"
	elif [ -f "$1" ]; then
		exec xdg-open "$(pwd)/$1" &
		exit 0
	else
		printf "%s is neither a file nor a directory\n" "$(pwd)/$1" >&2
	fi
}

needed=("xdg-open" "rofi")

for n in "${needed[@]}"; do
	if ! which "$n" &> /dev/null; then
		printf "Please install %s in order to use this script!\n" "$n" >&2
		exit 1
	fi
done