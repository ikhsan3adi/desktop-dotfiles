# AGENTS.md — unix-desktop-dotfiles

Personal Arch Linux Sway desktop config by [ikhsan3adi](https://github.com/ikhsan3adi). Entirely Catppuccin Frappé themed.

## Repo layout

Each top-level directory is a config for that application. No monorepo, no build system.

## Install

All configs are plain files — no build, test, lint, or typecheck commands exist.

**`install.sh`** asks for confirmation before symlinking each component.
**`uninstall.sh`** removes symlinks (asks confirmation each); skips VSCodium and ly for safety.
- alacritty, fastfetch, sway, oh-my-posh, mako, waybar, rofi, fish/config.fish, wallpaper
- cava, foot, ly
- VSCodium (calls `VSCodium/install.sh` — also covers VSCode, Cursor, Windsurf)
- scripts (`s-*.sh` → `~/.local/bin/`)
- Screenshots directory (`~/Pictures/Screenshots`)

Colors are canonically defined in one place but duplicated across components:
- `sway/colors` (sway variables, sourced by `sway/config`)
- `sway/colors.sh` (bash variables, sourced by `sway/lock.sh`)
- `waybar/colors.css` (CSS `@define-color` variables)
- `rofi/colors.rasi` (rasi variables)

When changing the theme palette, update all four files.

## Accent color

**`scripts/change-accent.sh`** changes the Catppuccin Frappé accent color across all configs at once. Run from repo root:

```sh
./scripts/change-accent.sh mauve
```

Valid accents: rosewater, flamingo, pink, mauve, red, maroon, peach, yellow, green, teal, sky, sapphire, blue, lavender.

It updates the accent variable in all 4 canonical color files plus oh-my-posh, replaces the old accent hex in mako/config, and optionally changes Papirus folder colors via `papirus-folders` (requires sudo).

## Key wiring

- `fish/config.fish` — loads oh-my-posh prompt (`dydx-frappe.omp.json`), runs `fastfetch` in alacritty/foot, sets PATH (Android SDK, go, phpenv).
- `sway/config` is the WM entrypoint — keybindings, workspace layout, app autostart, dual-monitor.
- `VSCodium/settings.json` — full editor config (fonts, inlay hints, themes, terminal).
- `scripts/install.sh` symlinks `s-*.sh` scripts to `~/.local/bin/`.

## WindowsOnly/

Cross-platform configs for dual-boot (PowerShell profile, Windows Terminal, VSCodium). Not relevant on Linux.
