#!/bin/bash

choice=$(echo -e "⏻  Shutdown\n  Reboot\n󰍁  Logout" | wofi --show dmenu --width 200 --height 225 --hide-scroll --conf ~/.config/waybar/scripts/no_search.conf)

case "$choice" in
  *Shutdown) systemctl poweroff ;;
  *Reboot) systemctl reboot ;;
  *Logout) hyprctl dispatch exit ;;
esac

