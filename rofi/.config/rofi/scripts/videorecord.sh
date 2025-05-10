#!/usr/bin/env bash

if [ x"$@" = x"Record Screen" ] && ! pgrep -f "gpu-screen-recorder" >/dev/null; then
    nohup gpu-screen-recorder \
        -w screen \
        -f 60 \
        -a "default_output|default_input" \
        -q very_high \
        -o "$HOME/Videos/recording_$(date +'%Y%m%d_%H%M%S').mp4" >/dev/null 2>&1 &
    exit 0
fi

if [ x"$@" = x"Record Region" ] && ! pgrep -f "gpu-screen-recorder" >/dev/null; then
    nohup gpu-screen-recorder \
        -w region \
        -region $(slurp -f "%wx%h+%x+%y") \
        -f 60 \
        -a "default_output|default_input" \
        -q very_high \
        -o "$HOME/Videos/recording_$(date +'%Y%m%d_%H%M%S').mp4" >/dev/null 2>&1 &
    exit 0
fi

if [ x"$@" = x"Stop Recording" ] && pgrep -f "gpu-screen-recorder" >/dev/null; then
    pkill -SIGINT -f gpu-screen-recorder
    notify-send "Screen Record" "Stopped recording"
    exit 0
fi

if [ x"$@" = x"Stop Recording" ] && ! pgrep -f "gpu-screen-recorder" >/dev/null; then
    notify-send "Screen Record" "gpu-screen-recorder is not currently running"
    exit 0
fi

echo -en "\0prompt\x1fselect option\n"
echo -en "\0no-custom\x1ftrue\n"
echo -en "\0keep-filter\x1ftrue\n"
echo "Stop Recording"
echo "Record Screen"
echo "Record Region"
