#!/usr/bin/env bash

if [[ ($ROFI_RETV == 1) && (x"$*" != x"") ]]; then
    mpc insert -- "$1"
    sleep 0.1
    mpc next -q
    mpc play -q
    exit 0
fi

echo -en "\0prompt\x1fselect track\n"
echo -en "\0no-custom\x1ftrue\n"
echo -en "\0keep-filter\x1ftrue\n"

while IFS= read -r -d '' file; do
    songfile="${file##*/}"
    songname="${songfile%.*}"
    echo -en "${songfile}\0display\x1f${songname}\n"
done < <(find -L ~/Music -type f -print0)
