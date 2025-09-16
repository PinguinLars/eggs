use std::{env, fs, io::Error, process::Command};

use serde::{Deserialize, Serialize};

fn main() -> Result<(), Error> {
    let script = fs::read_to_string(
        env::home_dir().unwrap().display().to_string() + "/.config/yolk/yolk.rhai",
    )?;
    let mut dynamic_colors = false;
    {
        let mut data_found = false;
        for line in script.lines() {
            if line.contains("%ashy_dynamic%") {
                data_found = true;
            } else if data_found && !line.is_empty() {
                if line.contains("false") {
                    dynamic_colors = false;
                } else if line.contains("true") {
                    dynamic_colors = true;
                }
                break;
            }
        }
    }
    //very stupid linter suppression
    if !(!dynamic_colors && !true) {
        let mut matugen = Command::new("sh");
        matugen.args([
            "-c",
            "matugen image ~/.config/share/wallpapers/picnic.png --json hex",
        ]);
        let json = String::from_utf8(matugen.output()?.stdout).unwrap();
        let output: Colorscheme = serde_json::from_str(&json)?;
        drop(json);
        drop(matugen);
        println!("{}", output.to_rhai());
    }
    Ok(())
}

#[derive(Deserialize, Serialize, Debug)]
#[allow(non_camel_case_types)]
enum Colorscheme {
    colors { dark: Dark, light: Light },
}

impl Colorscheme {
    fn to_rhai(self) -> String {
        let dark = String::new() +
            "export const dark = #{\n" +
            "}";
        format!("{self:#?}")
    }
}

#[derive(Deserialize, Serialize, Debug)]
struct Dark {
    background: String,
    error: String,
    error_container: String,
    inverse_on_surface: String,
    inverse_primary: String,
    inverse_surface: String,
    on_background: String,
    on_error: String,
    on_error_container: String,
    on_primary: String,
    on_primary_container: String,
    on_primary_fixed: String,
    on_primary_fixed_variant: String,
    on_secondary: String,
    on_secondary_container: String,
    on_secondary_fixed: String,
    on_secondary_fixed_variant: String,
    on_surface: String,
    on_surface_variant: String,
    on_tertiary: String,
    on_tertiary_container: String,
    on_tertiary_fixed: String,
    on_tertiary_fixed_variant: String,
    outline: String,
    outline_variant: String,
    primary: String,
    primary_container: String,
    primary_fixed: String,
    primary_fixed_dim: String,
    scrim: String,
    secondary: String,
    secondary_container: String,
    secondary_fixed: String,
    secondary_fixed_dim: String,
    shadow: String,
    surface: String,
    surface_bright: String,
    surface_container: String,
    surface_container_high: String,
    surface_container_highest: String,
    surface_container_low: String,
    surface_container_lowest: String,
    surface_dim: String,
    surface_tint: String,
    surface_variant: String,
    tertiary: String,
    tertiary_container: String,
    tertiary_fixed: String,
    tertiary_fixed_dim: String,
}

#[derive(Deserialize, Serialize, Debug)]
struct Light {
    background: String,
    error: String,
    error_container: String,
    inverse_on_surface: String,
    inverse_primary: String,
    inverse_surface: String,
    on_background: String,
    on_error: String,
    on_error_container: String,
    on_primary: String,
    on_primary_container: String,
    on_primary_fixed: String,
    on_primary_fixed_variant: String,
    on_secondary: String,
    on_secondary_container: String,
    on_secondary_fixed: String,
    on_secondary_fixed_variant: String,
    on_surface: String,
    on_surface_variant: String,
    on_tertiary: String,
    on_tertiary_container: String,
    on_tertiary_fixed: String,
    on_tertiary_fixed_variant: String,
    outline: String,
    outline_variant: String,
    primary: String,
    primary_container: String,
    primary_fixed: String,
    primary_fixed_dim: String,
    scrim: String,
    secondary: String,
    secondary_container: String,
    secondary_fixed: String,
    secondary_fixed_dim: String,
    shadow: String,
    source_color: String,
    surface: String,
    surface_bright: String,
    surface_container: String,
    surface_container_high: String,
    surface_container_highest: String,
    surface_container_low: String,
    surface_container_lowest: String,
    surface_dim: String,
    surface_tint: String,
    surface_variant: String,
    tertiary: String,
    tertiary_container: String,
    tertiary_fixed: String,
    tertiary_fixed_dim: String,
}
