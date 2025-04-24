#!/bin/bash

isRunning() {
    ps -p $(pidof -xs pipewire) > /dev/null 2>&1
}

while ! isRunning; do
    sleep 1
done

waybar -l off &
