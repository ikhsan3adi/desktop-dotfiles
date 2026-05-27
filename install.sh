#!/bin/bash

confirm() {
    while true; do
        read -p "$1 [y/n] " yn
        case $yn in
            [Yy]*) return 0 ;;
            [Nn]*) return 1 ;;
        esac
    done
}

confirm "fastfetch" && ln -s $(pwd)/fastfetch ~/.config
echo

confirm "alacritty" && ln -s $(pwd)/alacritty ~/.config
echo

confirm "cava" && ln -s $(pwd)/cava ~/.config
echo

confirm "foot" && ln -s $(pwd)/foot ~/.config
echo

if confirm "sway"; then
    ln -s $(pwd)/sway ~/.config
fi
echo

confirm "oh-my-posh" && ln -s $(pwd)/oh-my-posh ~/.config
echo

if confirm "ly (display manager, requires sudo)"; then
    sudo ln -s $(pwd)/ly/config.ini /etc/ly/config.ini
fi
echo

confirm "mako" && ln -s $(pwd)/mako ~/.config
echo

confirm "waybar" && ln -s $(pwd)/waybar ~/.config
echo

confirm "rofi" && ln -s $(pwd)/rofi ~/.config
echo

if confirm "fish/config.fish"; then
    mkdir -p ~/.config/fish
    ln -s $(pwd)/fish/config.fish ~/.config/fish/config.fish
fi
echo

if confirm "wallpaper"; then
    mkdir -p ~/Pictures/wallpapers
    ln -s $(pwd)/images/wallpaper_old.png ~/Pictures/wallpapers/wallpaper_old.png
fi
echo

if confirm "Screenshots directory (~/Pictures/Screenshots)"; then
    mkdir -p ~/Pictures/Screenshots
fi
echo

if confirm "VSCodium (and VSCode/Cursor/Windsurf/Antigravity IDE configs)"; then
    bash $(pwd)/VSCodium/install.sh
fi
echo

if confirm "scripts (s-*.sh -> ~/.local/bin/)"; then
    mkdir -p ~/.local/bin
    bash $(pwd)/scripts/install.sh
fi
echo

echo "Done."
