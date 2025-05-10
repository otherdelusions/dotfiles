#!/usr/bin/env bash

# Options
shutdown=''
reboot=''
lock=''
suspend=''
logout='󰍃'

# Pass variables to rofi dmenu
run_rofi() {
    echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi -dmenu -theme ~/.config/rofi/powermenu.rasi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
$shutdown)
    loginctl poweroff
    ;;
$reboot)
    loginctl reboot
    ;;
$lock)
    hyprlock
    ;;
$suspend)
    playerctl stop
    loginctl suspend
    ;;
$logout)
    pkill -9 -u $USER
    ;;
esac
