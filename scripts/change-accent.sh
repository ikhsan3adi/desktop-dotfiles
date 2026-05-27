#!/bin/bash

# Catppuccin Frappé accent colors
declare -A HEX
HEX=(
    [rosewater]="#f2d5cf"
    [flamingo]="#eebebe"
    [pink]="#f4b8e4"
    [mauve]="#ca9ee6"
    [red]="#e78284"
    [maroon]="#ea999c"
    [peach]="#ef9f76"
    [yellow]="#e5c890"
    [green]="#a6d189"
    [teal]="#81c8be"
    [sky]="#99d1db"
    [sapphire]="#85c1dc"
    [blue]="#8caaee"
    [lavender]="#babbf1"
)

usage() {
    echo "Usage: $(basename "$0") <accent>"
    echo "Valid: ${!HEX[*]}"
    exit 1
}

NEW=$1
[ -n "$NEW" ] || usage
[ -n "${HEX[$NEW]}" ] || usage

REPO="$(cd "$(dirname "$0")/.." && pwd)"

# Detect current accent from sway/colors
CURRENT=$(grep -oP '(?<=^set \$accent \$).*' "$REPO/sway/colors")
[ -z "$CURRENT" ] && echo "Could not detect current accent from sway/colors" && exit 1

OLD_HEX="${HEX[$CURRENT]}"
NEW_HEX="${HEX[$NEW]}"

echo "Changing accent: $CURRENT ($OLD_HEX) -> $NEW ($NEW_HEX)"
echo

# --- Accent variable definitions ---

sed -i "s/^set \$accent \$.*/set \$accent \$$NEW/" "$REPO/sway/colors"
swaymsg reload
echo "  updated sway/colors"

sed -i "s/^accent=\$.*/accent=\$$NEW/" "$REPO/sway/colors.sh"
echo "  updated sway/colors.sh"

sed -i "s/^@define-color accent @.*;/@define-color accent @$NEW;/" "$REPO/waybar/colors.css"
echo "  updated waybar/colors.css"

sed -i "s/^  accent:         @.*;/  accent:         @$NEW;/" "$REPO/rofi/colors.rasi"
echo "  updated rofi/colors.rasi"

sed -i 's/"accent": "p:[^"]*"/"accent": "p:'"$NEW"'"/' "$REPO/oh-my-posh/dydx-frappe.omp.json"
echo "  updated oh-my-posh/dydx-frappe.omp.json"

# --- Hardcoded hex values (non-palette files) ---

# mako/config: only active config lines, skip comments
if grep -q "$OLD_HEX" "$REPO/mako/config" 2>/dev/null; then
    sed -i "/^[^#]/s/$OLD_HEX/$NEW_HEX/g" "$REPO/mako/config"
    makoctl reload
    echo "  updated mako/config"
fi

# --- Papirus folder icons (requires sudo) ---

if command -v papirus-folders &>/dev/null; then
    PAPIRUS_COLOR="cat-frappe-$NEW"
    echo
    echo "Papirus folder icons available."
    echo "Would you like to update folder colors to $PAPIRUS_COLOR? (requires sudo)"
    echo -n "Update Papirus folders? [y/n] "
    read -r yn
    case $yn in
        [Yy]*)
            sudo papirus-folders -C "$PAPIRUS_COLOR" --theme Papirus-Dark
            echo "  updated Papirus folder colors"
            ;;
    esac
fi

echo
echo "Done. Reload your configs to see the change."
