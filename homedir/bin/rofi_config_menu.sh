#!/usr/bin/env bash
#
# Script name: dmconf
# Description: Choose from a list of configuration files to edit.
# Dependencies: dmenu
# GitLab: https://www.gitlab.com/dwt1/dmscripts
# Contributors: Derek Taylor

# Defining the text editor to use.
# DMENUEDITOR="vim"
# DMENUEDITOR="nvim"
DMEDITOR="code"

# An array of options to choose.
# You can edit this list to add/remove config files.
declare -a options=(
    "bash - $HOME/.bashrc"
    "dunst - $HOME/.config/dunst/dunstrc"
    "i3 - $HOME/.config/i3/config"
    "firefox CSS - .mozilla/firefox/s012h755.default-release/chrome/userChrome.css"
    "kitty - $HOME/.config/kitty/kitty.conf"
    "newsboat URL - $HOME/.newsboat/urls"
    "picom - $HOME/.config/picom/picom.conf"

    "[edit] - $HOME/.bin/rofi_config_menu.sh"
    "[quit]"
)

# Piping the above array into dmenu.
# We use "printf '%s\n'" to format the array one item to a line.
choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i 20 -p 'Edit config:')

# What to do when/if we choose 'quit'.
if [[ "$choice" == "[quit]" ]]; then
    echo "Program terminated." && exit 1

# What to do when/if we choose a file to edit.
elif [ "$choice" ]; then
    cfg=$(printf '%s\n' "${choice}" | awk '{print $NF}')
    $DMEDITOR "$cfg"
    sleep .5
    i3-msg '[class=(?i)'Code'] focus' 

# What to do if we just escape without choosing anything.
else
    echo "Program terminated." && exit 1
fi
