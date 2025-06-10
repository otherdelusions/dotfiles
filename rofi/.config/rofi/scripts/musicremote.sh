#!/usr/bin/env bash

# mpd music directory
musicdir=~/Music

# where song cover will be saved and where is the backup cover picture if we cant extract cover from song file
coverpath=/tmp/cover.png
backup_coverpath=~/.config/rofi/themes/assets/cover.png

# where we will store the selected element index to persist across runs of this script
selection_file="$HOME/.cache/rofi_remote_selection"

if [ -f "$selection_file" ]; then
    selected_row=$(cat "$selection_file")
else
    selected_row=2
fi

# metadata
ffmpeg -loglevel quiet -i "$musicdir"/"$(mpc current -f %file%)" -vf scale=300:300 "${coverpath}" -y || cp $backup_coverpath $coverpath
title=$(mpc -f %title% current)
title=${title:-No title}
title="${title:0:25}"

artist=$(mpc -f %artist% current)
artist=${artist:-No artist}
artist="${artist:0:25}"

album=$(mpc -f %album% current)
album=${album:-No album}
album="${album:0:25}"

# buttons
menu=' 󰍜 '
prev=' 󰒮 '
[[ $(mpc status %state%) == "paused" ]] && playpause=' 󰐊 ' || playpause=' 󰏤 '
next=' 󰒭 '
[[ $(mpc status %random%) == "off" ]] && shuffle=' 󰒞 ' || shuffle=' 󰒝 '
close=' 󰅖 '

theme=tui
theme_path="$HOME/.config/rofi/themes/$theme/launcher.rasi"

run_rofi() {
    echo -e "$menu\n$prev\n$playpause\n$next\n$shuffle\n$close" | rofi -dmenu -markup-rows -selected-row "$selected_row" -hover-select -theme ~/.config/rofi/themes/$theme/music.rasi \
        -p "$title
$artist
$album"
}

chosen="$(run_rofi)"
case ${chosen} in
"$menu")
    rofi -show musicplay -modes "musicplay" -theme "$theme_path" \
        -theme-str "window { width: 600px; }"
    echo "0" >"$selection_file"
    exec "$0"
    ;;
"$prev")
    mpc prev -q
    echo "1" >"$selection_file"
    exec "$0"
    ;;
"$next")
    mpc next -q
    echo "3" >"$selection_file"
    exec "$0"
    ;;
"$playpause")
    if [[ $(mpc status %songpos%) == "0" ]]; then
        mpc add /
        mpc play -q
    else
        if [[ $(mpc status %state%) == "paused" ]]; then
            mpc play -q
        else
            mpc pause -q
        fi
    fi
    echo "2" >"$selection_file"
    exec "$0"
    ;;
"$shuffle")
    if [[ $(mpc status %random%) == "off" ]]; then
        mpc -q random on
    else
        mpc -q random off
    fi
    echo "4" >"$selection_file"
    exec "$0"
    ;;
"$close")
    mpc stop -q
    mpc clear -q
    ;;
esac
