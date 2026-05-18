#!/usr/bin/env bash
set -euo pipefail

player="spotify_player"
status=$(playerctl -p "$player" status 2>/dev/null || true)

case "$status" in
    Playing|Paused)
        artist=$(playerctl -p "$player" metadata artist 2>/dev/null || true)
        title=$(playerctl -p "$player" metadata title 2>/dev/null || true)
        printf '{"text":" %s - %s","tooltip":"Spotify: %s"}\n' "$artist" "$title" "$status"
        ;;
    *)
        printf '\n'
        ;;
esac
