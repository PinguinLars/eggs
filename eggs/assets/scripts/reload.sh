#!/usr/bin/env bash
~/.config/yolk/ashy-dots/target/release/ashy-dots $HOME$(yolk eval 'get_wallpaper_path("")')
hellwal -i ~/.config/share/wallpapers/mc_pride.png
yolk sync || notify-send "dotfiles" "Error reloading!"
swww img $HOME$(yolk eval 'get_wallpaper_path("")') -t none
makoctl reload
pkill -12 waybar
