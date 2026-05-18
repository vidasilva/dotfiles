#!/usr/bin/env sh
set -eu

get_weather_icon() {
    condition=$(printf '%s' "$1" | tr '[:upper:]' '[:lower:]')

    case "$condition" in
        *clear*|*sunny*) echo "" ;;
        *cloudy*|*overcast*) echo "" ;;
        *rain*|*drizzle*|*showers*) echo "" ;;
        *thunder*) echo "" ;;
        *snow*|*sleet*|*hail*) echo "" ;;
        *fog*|*mist*|*haze*) echo "" ;;
        *) echo "" ;;
    esac
}

location="SaoPaulo"
req=$(curl -fsS "wttr.in/${location}?format=%C|%t|%l+(%f)+%h" || printf 'Unavailable|--|Weather unavailable')

condition_name=$(printf '%s' "$req" | awk -F '|' '{print $1}')
temperature=$(printf '%s' "$req" | awk -F '|' '{print $2}')
tooltip_content=$(printf '%s' "$req" | awk -F '|' '{print $3}')
icon=$(get_weather_icon "$condition_name")

printf '{"text":"%s %s","tooltip":"%s, %s"}\n' "$icon" "$temperature" "$condition_name" "$tooltip_content"
