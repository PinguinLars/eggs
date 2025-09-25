import "colors" as colors;
import "dynamic" as dynamic;

let school_mode = false;
let dynamic_colors = true;
let dark_mode = true;
let font = "JetBrainsMono Nerd Font Propo";
let colorscheme = colors::colorschemes.rosepine;
/*
 * wallpapers (path relative to $YOLK/eggs/assets/wallpapers
 * //changes after sync to ~/.config/share/wallpapers)
 */
let wallpaper = #{
    normal: "lockedin.png",
    school: "weeb.png",
};

export let data = #{
    dynamic_colors: dynamic_colors,
    colors: if dynamic_colors && dark_mode {
        dynamic::dark
    } else if dynamic_colors && !dark_mode {
        dynamic::light
    } else {
        colorscheme
    },
    font: font,
    assets_path: ".config/share/",
    test: if dynamic_colors {

    } else {
        colors::colorschemes.rosepine
    },
    wallpaper: wallpaper.normal,
    wallpaper_school: wallpaper.school,
    school_mode: school_mode,
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
    },
    assets: #{
        targets: "~/.config/share",
        enabled: true,
    }
};

fn fetch_title() {
    if !data.school_mode {
        return "    {\"type\": \"title\",\"format\": \"{#bold_"+data.colors.title+"}ashley{#}@{#bold_"+data.colors.title+"}{host-name}\"},";
    } else {
        return "    \"title\",";
    }
}

fn get_wallpaper_path(home) {
    if data.school_mode {
        return home + "/" + data.assets_path + "wallpapers/" + data.wallpaper_school;
    } else {
        return home + "/" + data.assets_path + "wallpapers/" + data.wallpaper;
    }
}

fn colorscheme() {
    if data.dynamic_colors {

    } else {
        return data.colorscheme.colors;
    }
}
