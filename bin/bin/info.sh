#!/usr/bin/env bash
#
# Usage: Notify-send current system info, called from the
#        i3 config file by bindsym.
#
# Script by Joris van Dijk | gitlab.com/jorisvandijk 
#
#          Published under GPL-3.0-or-later

# notify-send -u normal -t 5000 "$(
    # printf "$(date "+%A %-d/%-m/%Y")\n"
    # printf "$(date "+%H:%M")\n\n"
    # bat=$(acpi | head -1 | awk {'print $3'})
    # if [[ $bat == Charging, ]]; then
        # echo $(acpi | head -1 | awk '{print substr($4, 1, length($4)-1)}'; echo ' charging')
    # else
        # echo $(acpi | head -1 | awk '{print substr($4, 1, length($4)-1)}')
    # fi
    # printf "$(nmcli -t -f name connection show --active)\n"
    # printf "$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d"\"" -f2)"
    # 
# )"

notify-send -u normal -t 5000 "$(
    printf "$(date "+%H:%M")\n"
    printf "$(date "+%A %-d/%-m/%Y")\n"
    bat=$(acpi | head -1 | awk {'print $3'})
    if [[ $bat == Charging, ]]; then
        echo $(acpi | head -1 | awk '{print substr($4, 1, length($4)-1)}'; echo ' charging')
    else
        echo $(acpi | head -1 | awk '{print substr($4, 1, length($4)-1)}')
    fi
    
)"
