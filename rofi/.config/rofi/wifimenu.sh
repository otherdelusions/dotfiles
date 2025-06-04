#!/usr/bin/env bash
theme=tui
"$HOME"/.local/bin/iwmenu -s 3 --launcher custom --launcher-command \
    "rofi -dmenu -theme ~/.config/rofi/themes/$theme/launcher.rasi"
