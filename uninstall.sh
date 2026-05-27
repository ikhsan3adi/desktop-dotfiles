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

repo="$(cd "$(dirname "$0")" && pwd)"

linked_to_repo() {
    local target="$1"
    local link
    link=$(readlink "$target" 2>/dev/null)
    [ -n "$link" ] && [ "${link#$repo}" != "$link" ]
}

echo "This script removes symlinks created by install.sh."
echo "Skipped for safety: VSCodium (and related editors), ly (display manager)."
echo "Repo files themselves are never deleted."
echo

if ! confirm "Continue with uninstall?"; then
    echo "Aborted."
    exit 0
fi
echo

for name in alacritty fastfetch cava foot sway oh-my-posh mako waybar rofi; do
    target="$HOME/.config/$name"
    if [ -L "$target" ] && linked_to_repo "$target"; then
        if confirm "Remove ~/.config/$name?"; then
            unlink "$target" && echo "  removed"
        fi
    fi
done

target="$HOME/.config/fish/config.fish"
if [ -L "$target" ] && linked_to_repo "$target"; then
    if confirm "Remove ~/.config/fish/config.fish?"; then
        unlink "$target" && echo "  removed"
    fi
fi

# target="$HOME/Pictures/wallpapers/wallpaper.png"
# if [ -L "$target" ] && linked_to_repo "$target"; then
#     if confirm "Remove wallpaper symlink?"; then
#         unlink "$target" && echo "  removed"
#     fi
# fi

for f in "$repo"/scripts/s-*.sh; do
    name="$(basename "$f")"
    target="$HOME/.local/bin/$name"
    if [ -L "$target" ] && [ "$(readlink "$target")" = "$f" ]; then
        if confirm "Remove ~/.local/bin/$name?"; then
            unlink "$target" && echo "  removed"
        fi
    fi
done

target="$HOME/Pictures/Screenshots"
if [ -d "$target" ]; then
    if confirm "Remove empty ~/Pictures/Screenshots/?"; then
        rmdir "$target" 2>/dev/null && echo "  removed" || echo "  (not empty, skipped)"
    fi
fi

echo
echo "Done."
