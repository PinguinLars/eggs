yolk sync || notify-send "dotfiles" "Error reloading!"
swww img $HOME$(yolk eval 'get_wallpaper_path("")')
makoctl reload
pkill -12 waybar
