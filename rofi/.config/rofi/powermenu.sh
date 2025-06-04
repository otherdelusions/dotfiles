#!/usr/bin/env bash

shutdown=''
reboot=''
lock=''
suspend=''
logout='󰍃'

theme=tui

run_rofi() {
    echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi -dmenu -sync -theme ~/.config/rofi/themes/$theme/powermenu.rasi
}

chosen="$(run_rofi)"
case ${chosen} in
"$shutdown")
    loginctl poweroff
    ;;
"$reboot")
    loginctl reboot
    ;;
"$lock")
    hyprlock
    ;;
"$suspend")
    playerctl stop
    loginctl suspend
    ;;
"$logout")
    pkill -9 -u "$USER"
    ;;
esac
