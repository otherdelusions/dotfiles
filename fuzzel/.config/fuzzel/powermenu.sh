#!/usr/bin/env bash

shutdown='shutdown'
reboot='reboot'
lock='lock'
suspend='suspend'
logout='logout'

run_fuzzel() {
    echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | fuzzel -d --lines 5
}

chosen="$(run_fuzzel)"
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
