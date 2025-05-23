#!/usr/bin/env bash

if [[ ($ROFI_RETV == 1) && (x"$*" != x"") ]]; then
    paperpath=$(find -L ~/Pictures/Wallpaper -type f -name "$*")
    papername=$(find -L ~/Pictures/Wallpaper -type f -name "$*" | sed "s|^/home/[^/]*/|\$HOME/|")

    cat <<EOF >"$HOME"/.config/hypr/hyprpaper.conf
\$wallpaper = $papername

preload = \$wallpaper
EOF

    if [[ "${paperpath##*/}" =~ -tile(\..*)?$ ]]; then
        echo "wallpaper = , tile:\$wallpaper" >>"$HOME"/.config/hypr/hyprpaper.conf
    else
        echo "wallpaper = , \$wallpaper" >>"$HOME"/.config/hypr/hyprpaper.conf
    fi

    killall -q hyprpaper
    nohup hyprpaper &>/dev/null &
    exit 0
fi

echo -en "\0prompt\x1fselect wallpaper\n"
echo -en "\0no-custom\x1ftrue\n"
echo -en "\0keep-filter\x1ftrue\n"

# find -L ~/Pictures/Wallpaper -type f -print0 | xargs -0 -I {} printf "%s\0icon\x1f%s\n" "$(basename "{}")" "{}"
while IFS= read -r -d '' file; do
    printf "%s\0icon\x1f%s\n" "${file##*/}" "$file"
done < <(find -L ~/Pictures/Wallpaper -type f -print0)
