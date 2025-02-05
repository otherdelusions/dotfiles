#!/bin/bash

# Add packages you wish to install here
# NOTE: assets folder is not meant to be stowed
# and wallpaper package should be stowed manually using:
# stow --verbose --adopt --target=[YOUR WALLPAPER FOLDER] wallpaper
packages=(
  "alacritty"
  "bash"
  "dunst"
  "helix"
  "hypr"
  "imv"
  "rofi"
  "starship"
  "waybar"
  "yazi"
)

for package in "${packages[@]}"; do
    echo -e "\nStowing package: $package"
    stow --verbose --restow --target="$HOME" "$package"
done
