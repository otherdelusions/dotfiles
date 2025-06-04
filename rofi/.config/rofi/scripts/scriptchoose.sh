#!/usr/bin/env bash
# web='󰖟'
# rec=''
web='Web Search'
rec='Screen Record'
wal='Wallpaper Switch'

theme='tui'
theme_path="$HOME/.config/rofi/themes/$theme/launcher.rasi"

run_rofi() {
    echo -e "$web\n$rec\n$wal" | rofi -dmenu -no-custom -p "scripts" -theme "$theme_path"
}

chosen="$(run_rofi)"
case ${chosen} in
"$web")
    rofi -show websearch -modes "websearch" -theme "$theme_path"
    ;;
"$rec")
    rofi -show videorecord -modes "videorecord" -theme "$theme_path"
    ;;
"$wal")
    rofi -show wallswitch -modes "wallswitch" -theme "$theme_path" \
        -theme-str "window { width: 600px; } \
        listview { columns: 3; lines: 3; } \
        element { orientation: vertical; padding: 0; } \
        element-icon { size: 128px; } \
        element-text { vertical-align: 0.5; horizontal-align: 0.5; }"
    ;;
esac
