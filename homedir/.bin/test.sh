#!/usr/bin/env bash

IFS=',' read -a Fields <<< "$(i3-msg -t get_workspaces)"

for Field in "${Fields[@]}"; {
    case $Field in
        \"num\":*) Target=$Field ;;
    esac
}

printf '%s\n' "${Target#*:}"