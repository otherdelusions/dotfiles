# Options
# web='󰖟'
# rec=''
web='Web Search'
rec='Screen Record'

# Pass variables to rofi dmenu
run_rofi() {
    echo -e "$web\n$rec" | rofi -dmenu -no-custom -p "scripts" -theme ~/.config/rofi/launcher.rasi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
"$web")
    rofi -show websearch -modes "websearch" -theme ~/.config/rofi/launcher.rasi
    ;;
"$rec")
    rofi -show videorecord -modes "videorecord" -theme ~/.config/rofi/launcher.rasi
    ;;
esac
