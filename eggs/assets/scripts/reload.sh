#!/usr/bin/env bash
~/.config/yolk/ashy-dots/target/release/ashy-dots $HOME$(yolk eval 'get_wallpaper_path("")')
hellwal -i ~/.config/share/wallpapers/mc_pride.png
yolk sync || notify-send "dotfiles" "Error reloading!"
# hellwal -i $(yolk eval "get_wallpaper_path(\"$HOME\")") -f $HOME/.config/hellwal/templates -q --neon-mode
makoctl reload
pkill -12 waybar
