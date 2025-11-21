#!/bin/fish
switch $(tuned-adm active | grep -o ':.*$' | grep -o '[a-z\-]*')
  case throughput-performance
    tuned-adm profile powersave
  case desktop
    tuned-adm profile throughput-performance
  case balanced
    tuned-adm profile desktop
  case powersave
    tuned-adm profile balanced
end
