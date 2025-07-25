#!/bin/bash

choice=$(echo -e "⏻  Shutdown\n  Reboot\n󰍁  Logout" | wofi --show dmenu --width 200 --height 136 --hide-scroll --hide-search) 

case "$choice" in
  *Shutdown) systemctl poweroff ;;
  *Reboot) systemctl reboot ;;
  *Logout) hyprctl dispatch exit ;;
esac

