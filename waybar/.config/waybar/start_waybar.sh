#!/usr/bin/env bash

isRunning() {
    ps -p "$(pidof -xs pipewire)" >/dev/null 2>&1
}

while ! isRunning; do
    sleep 1
done

namefile="$HOME/.config/waybar/.currentname"

if [ ! -f "$namefile" ]; then
    "$(dirname "$0")"/switch_theme.sh retro
    exit 0
fi

theme=$(<"$namefile")

waybar -l off -c "$HOME/.config/waybar/config-$theme.jsonc" -s "$HOME/.config/waybar/style-$theme.css" &
disown
