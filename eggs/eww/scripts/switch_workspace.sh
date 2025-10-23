#!/bin/sh
# inspired by https://github.com/KatieUmbra/Dotfiles/blob/main/eggs/eww/scripts/change-active-workspace.sh

function clamp {
 min=$1
 max=$2
 val=$3
 python -c "print(max($min, min($val, $max)))"
}

direction=$1
active=$2
# max=$(niri msg -j workspaces | jq 'sort_by(.idx) | .[-1] | .idx')
max=10
if test "$direction" = "up"; then
  target=$(clamp 1 $max $(($active-1)))
  echo "jumping to $target"
  niri msg action focus-workspace $target
elif test "$direction" = "down"; then
  target=$(clamp 1 $max $(($active+1)))
  echo "jumping to $target"
  niri msg action focus-workspace $target
fi
