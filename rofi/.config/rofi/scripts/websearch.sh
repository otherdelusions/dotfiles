#!/usr/bin/env bash

if [[ ($ROFI_RETV == 2) && (x"$*" != x"") ]]; then
    nohup xdg-open "https://duckduckgo.com/?kae=d&q=$*" >/dev/null 2>&1 &
    exit 0
fi

echo -en "\0prompt\x1fsearch\n"
