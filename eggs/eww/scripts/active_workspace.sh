#!/bin/sh
niri msg event-stream | while read -r line; do
  niri msg -j workspaces | jq -cM '.[] | select (.output == "eDP-1") | select (.is_active) | .idx'
done
