#!/bin/bash

# Add packages you wish to install here
# NOTE: assets folder is not meant to be stowed
packages=(
    "alacritty"
    "bash"
    "dunst"
    "go"
    "helix"
    "hypr"
    "imv"
    "rofi"
    "starship"
    "waybar"
    "yazi"
)

if ! command -v stow >/dev/null; then
    echo "Stow command not found! Install stow and rerun the script." >&2
    exit 1
fi

for package in "${packages[@]}"; do
    echo -e "\nStowing package: $package"
    stow --verbose --restow --target="$HOME" "$package"
done

read -p "Enter your wallpaper folder path: " wpfolder

if [ -z "$wpfolder" ]; then
    wpfolder="$HOME/Pictures/Wallpaper"
    echo -e "Using default location"
fi

echo -e "\nStowing package: wallpaper to: $wpfolder"
stow --verbose --adopt --target="$wpfolder" wallpaper
