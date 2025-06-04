#!/usr/bin/env bash

ignored_players="librewolf, firefox"

update_display() {
    playerctl --ignore-player="$ignored_players" --player= -F metadata -f '{{status}} {{trunc(title, 10)}} - {{trunc(artist, 8)}}' |
        while read line; do
            words=($line)
            if [ "${words[0]}" == "Playing" ]; then
                echo "󰏤 ${words[*]:1}"
            elif [ "${words[0]}" == "Paused" ]; then
                echo "󰐊 ${words[*]:1}"
            elif [ "${words[0]}" == "Stopped" ]; then
                echo "󰓛 Stopped"
            else
                echo "$line"
            fi
        done
}

update_display
