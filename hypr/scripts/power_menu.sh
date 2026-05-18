#!/usr/bin/env bash

choice=$(printf "Shutdown\nReboot\nLogout\nCancel" | \
  wofi --dmenu --width 200 --lines 4 --hide-search)

case "$choice" in
  Shutdown)
    systemctl poweroff
    ;;
  Reboot)
    systemctl reboot
    ;;
  Logout)
    hyprctl dispatch exit
    ;;
  *)
    exit 0
    ;;
esac

