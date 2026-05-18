#!/usr/bin/env bash
set -euo pipefail

config_dir="$HOME/.config/waybar"
config_files=(
    "$config_dir/config"
    "$config_dir/style.css"
)

restart_waybar() {
    killall -q waybar || true

    while pgrep -x waybar >/dev/null; do
        sleep 0.2
    done

    waybar &
}

restart_waybar

while inotifywait -q -e create,modify,move,delete "${config_files[@]}"; do
    restart_waybar
done
