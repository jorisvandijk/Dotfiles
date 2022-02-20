selected=$(ls ~/.bin/rofi_scripts |rofi -dmenu -p "Run: ")
kitty --hold sh ~/.bin/rofi_scripts/$selected