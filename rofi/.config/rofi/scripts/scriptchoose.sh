#!/usr/bin/env bash
# web='󰖟'
# rec=''
web='Web Search'
rec='Screen Record'
wal='Wallpaper Switch'

run_rofi() {
    echo -e "$web\n$rec\n$wal" | rofi -dmenu -no-custom -p "scripts" -theme ~/.config/rofi/launcher.rasi
}

chosen="$(run_rofi)"
case ${chosen} in
"$web")
    rofi -show websearch -modes "websearch" -theme ~/.config/rofi/launcher.rasi
    ;;
"$rec")
    rofi -show videorecord -modes "videorecord" -theme ~/.config/rofi/launcher.rasi
    ;;
"$wal")
    rofi -show wallswitch -modes "wallswitch" -theme ~/.config/rofi/wallswitch.rasi
    ;;
esac
