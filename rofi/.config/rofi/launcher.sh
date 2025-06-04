#!/usr/bin/env bash

theme=tui
rofi \
    -show drun \
    -modes "drun,run,window" \
    -theme ~/.config/rofi/themes/$theme/launcher.rasi
