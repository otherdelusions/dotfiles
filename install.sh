echo -e "\033[32mSymlinking .config\033[0m"
stow --verbose --restow --target=$HOME .
echo -e "\033[32mSymlinking wallpaper\033[0m"
mkdir -p ~/Pictures/Wallpaper && stow --verbose --restow --target=$HOME/Pictures/Wallpaper wallpaper
