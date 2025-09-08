import "colors" as colors;

export let school_mode = false;

export let data = #{
  colors: colors::colorschemes.rosepine,
  font: "JetBrainsMono Nerd Font Propo",
  color: colors::colorschemes,
  assets_path: "~/.config/yolk/assets/",
  wallpaper: if school_mode {"weeb.png"} else {"KAITO-thighs.png"},
};

export let eggs = #{
  hyfetch: #{
    targets: #{
      "hyfetch.json": "~/.config/hyfetch.json",
    },
    enabled: true,
  },
  waybar: #{
    targets: "~/.config/waybar",
    templates: ["*.css","*.jsonc"],
    enabled: true,
  },
  niri: #{
    targets: "~/.config/niri",
    templates: ["*.kdl"],
    enabled: true,
  },
  fastfetch: #{
    targets: "~/.config/fastfetch",
    templates: ["*.jsonc"],
    enabled: true
  },
  kitty: #{
    targets: "~/.config/kitty",
    templates: ["*.conf"],
    enabled: true
  },
  mako: #{
    targets: "~/.config/mako",
    templates: ["config"],
    enabled: true
  },
  starship: #{
    targets: #{
      "starship.toml": "~/.config/starship.toml",
    },
    templates: ["starship.toml"],
    enabled: true,
  },
  hypr: #{
    targets: "~/.config/hypr",
    templates: ["*.conf"],
    enabled: true
  },
  swaylock: #{
    targets: "~/.config/swaylock",
    templates: ["config"],
    enabled: true
  },
  systemd: #{
    targets: "~/.config/systemd/user",
    templates: ["*.service"],
    enabled: true,
    unsafe_shell_hooks: #{
      post_undeploy: "systemctl stop swaybg.service --user && systemctl daemon-reload --user && systemctl start swaybg.service --user",
      post_deploy: "systemctl start swaybg.service --user"
    }
  },
  quickshell: #{
    targets: "~/.config/quickshell",
    templates: ["*.qml"],
    enabled: false,
  },
  lsd: #{
    targets: "~/.config/lsd",
    templates: ["*.yml"],
    enabled: true
  }
};

fn fetch_title() {
  if !school_mode {
    return "    {\"type\": \"title\",\"format\": \"{#bold_#ebbcba}ashley{#}@{#bold_#ebbcba}{host-name}\"},";
  } else {
    return "    \"title\",";
  }
}