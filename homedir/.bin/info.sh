#!/usr/bin/env bash
#
# Usage: Notify-send current system info, called from the
#        i3 config file by bindsym.
#
# Script by Joris van Dijk | gitlab.com/jorisvandijk 
#
#          Published under GPL-3.0-or-later

# notify-send -u normal -t 15000 "$(
#     printf "The time is $(date +"%R") on\n"
#     printf "$(date +"%A %-d %B %Y")\n"
#     bat=$(acpi | awk {'print $3'})
#     if [[ $bat == Charging, ]]; then
#         echo $(echo "Battery is at"; acpi | awk '{print substr($4, 1, length($4)-1)}'; echo "and charging")
#     else
#         echo $(echo "Battery is at"; acpi | awk '{print substr($4, 1, length($4)-1)}')
#     fi
    
#     printf "You're on workspace $(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d"\"" -f2)"
# )"  

notify-send -u normal -t 15000 "$(
    printf " $(date "+%A %-d %-B %Y")\n"
    printf " $(date "+%H:%M")\n"
    bat=$(acpi | awk {'print $3'})
    if [[ $bat == Charging, ]]; then
        echo $(echo "" ; acpi | awk '{print substr($4, 1, length($4)-1)}')
    else
        echo $(echo "" ; acpi | awk '{print substr($4, 1, length($4)-1)}')
    fi
    
    printf " $(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d"\"" -f2)"
)"