# [My](https://github.com/ikhsan3adi) Dotfiles

My Simple Archlinux Desktop Config Files 🍚

> _Applicable to other distros beside Archlinux aswell_

|                     | App/Program/Utilities Used                                                                                                                                                                                                                                                                                                                                                                                      |
| :------------------ | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Window Manager      | [`sway`](https://swaywm.org/)                                                                                                                                                                                                                                                                                                                                                                                   |
| Launcher            | [`rofi-wayland`](https://github.com/lbonn/rofi)                                                                                                                                                                                                                                                                                                                                                                 |
| Lockscreen          | [`swaylock-effects`](https://github.com/mortie/swaylock-effects)                                                                                                                                                                                                                                                                                                                                                |
| Status Bar          | [`waybar`](https://github.com/Alexays/Waybar)                                                                                                                                                                                                                                                                                                                                                                   |
| Network             | [`networkmanager`](https://archlinux.org/packages/?name=networkmanager)                                                                                                                                                                                                                                                                                                                                         |
| Brightness          | [`light`](https://gitlab.com/dpeukert/light)                                                                                                                                                                                                                                                                                                                                                                    |
| Audio               | [`pipewire`](https://pipewire.org/)                                                                                                                                                                                                                                                                                                                                                                             |
| Notification        | [`mako`](https://github.com/emersion/mako)                                                                                                                                                                                                                                                                                                                                                                      |
| Screenshot          | [`grim`](https://gitlab.freedesktop.org/emersion/grim) \w [`slurp`](https://github.com/emersion/slurp)                                                                                                                                                                                                                                                                                                          |
| Terminal            | [`alacritty`](https://github.com/alacritty/alacritty), [`foot`](https://codeberg.org/dnkl/foot)                                                                                                                                                                                                                                                                                                                 |
| Shell               | [`fish`](https://fishshell.com/)                                                                                                                                                                                                                                                                                                                                                                                |
| Shell Prompt        | [`oh-my-posh`](https://ohmyposh.dev/)                                                                                                                                                                                                                                                                                                                                                                           |
| File Manager        | [Thunar](https://docs.xfce.org/xfce/thunar/start)                                                                                                                                                                                                                                                                                                                                                               |
| GTK settings editor | [`nwg-look`](https://github.com/nwg-piotr/nwg-look)                                                                                                                                                                                                                                                                                                                                                             |
| GTK theme           | [Catppuccin Frappé GTK](https://github.com/catppuccin/gtk/blob/main/docs/USAGE.md)                                                                                                                                                                                                                                                                                                                              |
| Folders Icon        | Papirus-Dark \w [Catppuccin Frappé Papirus Folders](https://github.com/catppuccin/papirus-folders)                                                                                                                                                                                                                                                                                                              |
| Cursor              | [Bibata](https://github.com/ful1e5/Bibata_Cursor)                                                                                                                                                                                                                                                                                                                                                               |
| Color Palette       | [Catppuccin Frappé](https://catppuccin.com/palette/)                                                                                                                                                                                                                                                                                                                                                            |
| Other               | [`wl-clipboard`](https://github.com/bugaevc/wl-clipboard), [`wlr-randr`](https://gitlab.freedesktop.org/emersion/wlr-randr), [`rfkill-input-handler-disable`](https://github.com/devkev/rfkill-input-handler-disable), [`overskride` bluetooth client](https://github.com/kaii-lb/overskride), [`imv` image viewer](https://sr.ht/~exec64/imv/), [`xarchiver` archive manager](https://github.com/ib/xarchiver) |

## Install

Choose one of the following method:

### A. Instal manually by copying or symlinking to your config path

```sh
# symlink sway configs
ln -s $(pwd)/sway ~/.config

# symlink wallpaper
mkdir -p ~/Pictures
ln -s $(pwd)/images/wallpaper.png ~/Pictures/wallpaper.png

# other configs aswell ...
```

### B. Using install script to use `alacritty`, `fish`, `oh-my-posh`, `sway` & other configs

> [!CAUTION]
> _**This may override your previous config!**_
>
> ```sh
> chmod +x ./install.sh
> ./install.sh
> ```
