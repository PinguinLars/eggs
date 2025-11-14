#!/bin/fish
# @fish-lsp-disable-next-line 4004 
niri msg event-stream | while read -l line
    set active_workspace $(niri msg -j workspaces | jq -cM '.[] | select (.output == "eDP-1") | select (.is_active) | .idx')
    set all_workspaces $(niri msg -j workspaces | jq -rcM '[.[] | select(.output == "eDP-1") | .idx] | sort | .[]')
    set yuck_first_workspace "(
  eventbox
  :class 'bar-element-left bar-element$(if test $active_workspace -eq $all_workspaces[1]; echo " active-workspace"; end)'
  '$all_workspaces[1]'
)
"
    set yuck_other_workspaces ""
    for workspace in $all_workspaces[2..-2]
      set yuck_other_workspaces "$yuck_other_workspaces(
  eventbox
  :class 'bar-element$(if test $active_workspace -eq $workspace; echo " active-workspace"; end)'
  ;;:onclick
  '$workspace'
)
"
    end
    echo "(box $yuck_first_workspace$yuck_other_workspaces)"
end
