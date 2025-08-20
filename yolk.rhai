import "colors" as colors;

export let data = #{
  colors: colors::colorschemes.rosepine,
  font: "JetBrainsMono Nerd Font Propo",
  color: colors::colorschemes,
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
    templates: ["config.jsonc","style.css","shared.jsonc"],
    enabled: true,
  },
  niri: #{
    targets: "~/.config/niri",
    templates: ["config.kdl"],
    enabled: true,
  },
  fastfetch: #{
    targets: "~/.config/fastfetch",
    templates: ["config.jsonc"],
    enabled: true
  },
  kitty: #{
    targets: "~/.config/kitty",
    templates: ["kitty.conf"],
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
//  eww: #{
//    targets: "~/.config/eww",
//    templates: ["*.scss", "*.yuck"],
//    enabled: true,
//  },
};

