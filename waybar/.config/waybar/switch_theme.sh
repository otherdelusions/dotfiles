#!/usr/bin/env bash

themes=(
    minimal
    flat
    retro
)

usage() {
    echo "Usage: $0 [OPTION] theme"
    echo -e "\n[ARGS]"
    echo "    theme         Name of the theme you want to switch to"
    echo "                  Can be empty to cycle between all themes"
    echo -e "\n[OPTIONS]"
    echo "    -h, --help    Show this message"
    echo "    -l, --list    List all available themes"
}

while [[ "$#" -gt 0 ]]; do
    case $1 in
    -h | --help)
        usage
        exit 0
        ;;
    -l | --list)
        echo "Available themes:"
        printf "%s\n" "${themes[@]}"
        exit 0
        ;;
    *)
        if ! echo "${themes[@]}" | grep -owq "$1"; then
            echo -e "Invalid option: $1\n"
            usage
            exit 1
        fi
        break
        ;;
    esac
done

current_theme="$(dirname "$0")/.currentindex"

if [ ! -f "$current_theme" ]; then
    echo 0 >"$current_theme"
fi

current_index=$(<"$current_theme")
if [ -n "$1" ]; then
    for i in "${!themes[@]}"; do
        if [ "${themes[$i]}" == "$1" ]; then
            next_index=$i
            break
        fi
    done
else
    next_index=$(((current_index + 1) % ${#themes[@]}))
fi

theme=${themes[$next_index]}

killall -q waybar || true
waybar -l off -c "$(dirname "$0")/config-$theme.jsonc" -s "$(dirname "$0")/style-$theme.css" >/dev/null &
disown

echo "$next_index" >"$current_theme"
echo "$theme" >"$(dirname "$0")/.currentname"
