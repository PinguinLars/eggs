if status is-interactive
  set -x EDITOR nvim
  if "true" == yolk eval 'data.dark_mode'
    hellwal -i $(yolk eval "get_wallpaper_path(\"$HOME\")") -f $HOME/.config/hellwal/templates -q --neon-mode
  else
    hellwal -i $(yolk eval "get_wallpaper_path(\"$HOME\")") -f $HOME/.config/hellwal/templates -q -l -c
  end
end

function fish_user_key_bindings
    fish_vi_key_bindings --no-erase insert
end

function starship_transient_prompt_func
    starship module character
end

function starship_transient_rprompt_func
  starship module time
end

starship init fish | source
enable_transience

# pnpm
set -gx PNPM_HOME "/home/lars/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

export PODMAN_COMPOSE_PROVIDER=/bin/podman-compose

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/lars/.ghcup/bin $PATH # ghcup-env