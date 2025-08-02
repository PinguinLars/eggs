import "colors" as colors;

export let data = #{
  colors: colors::colorschemes.weeb.dark,
  font: "JetBrainsMono Nerd Font Propo",
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
    templates: ["config.jsonc","style.css"],
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
  }
};

