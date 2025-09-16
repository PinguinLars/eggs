yolk sync || notify-send "dotfiles" "Error reloading!"
systemctl --user daemon-reload && systemctl --user restart swaybg.service
makoctl reload
pkill -12 waybar
