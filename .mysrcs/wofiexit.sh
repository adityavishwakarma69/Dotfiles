#!/usr/bin/env bash

# A rofi-like System/Exit menu for wofi

# wofi crashes w/ no cache file, so let's use a custom one and delete it every time, to avoid reordering entries
rm /home/piotr/.local/share/wofi/exit.cache

A=$(wofi --show dmenu --conf=$HOME/.mysrcs/wofiexit.conf --cache-file=/home/piotr/.local/share/wofi/exit.cache --prompt=System --hide_search=TRUE cat <<EOF
 Lock
 Logout
 Reboot
󰆸 Shutdown
EOF
)

case "$A" in

    *Lock) swaylock -f -c 000000 ;;

    *Logout) loginctl terminate-user $USER;;

    *Reboot) reboot;;

    *Shutdown) shutdown now;;

esac

exit 0
