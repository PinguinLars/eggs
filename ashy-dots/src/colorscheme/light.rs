use crate::colorscheme::color_mode::ColorMode;
use serde::{Deserialize, Serialize};

impl ColorMode for Light {
    fn to_rhai_table(self) -> String {
        let test = [
            "export const light = #{".into(),
            format!("foreground: \"{}\",", self.on_background),
            format!("background: \"{}\",", self.background),
            format!("text: \"{}\",", self.on_background),
            format!("focused: \"{}\",", self.primary),
            format!("unfocused: \"{}\",", self.outline_variant),
            format!("waybar_button_hover: \"{}\",", self.primary),
            format!("waybar_button_active: \"{}\",", self.tertiary),
            format!("subtle_highlight: \"{}\",", self.surface_bright),
            format!("critical: \"{}\",", self.error),
            format!("error: \"{}\",", self.error_container),
            format!("high: \"{}\",", self.tertiary),
            format!("low: \"{}\",", self.secondary),
            format!("normal: \"{}\",", self.primary),
            format!("calendar_days: \"{}\",", self.secondary),
            format!("calendar_months: \"{}\",", self.primary),
            format!("calendar_today: \"{}\",", self.tertiary),
            format!("calendar_weekdays: \"{}\",", self.primary),
            format!("calendar_weeks: \"{}\",", self.tertiary),
            format!("noti_background: \"{}\",", self.background),
            format!("term_cursor: \"{}\",", self.surface_variant),
            format!("term_active_tab_foreground:\"{}\",", self.on_surface),
            format!("term_active_tab_background:\"{}\",", self.surface_bright),
            format!("term_inactive_tab_foreground:\"{}\",", self.on_surface),
            format!("term_inactive_tab_background:\"{}\",", self.surface_container),
            format!("term_selection_foreground:\"{}\",", self.on_surface),
            format!("term_selection_background:\"{}\",", self.surface_container_highest),
            "term_color0: \"#000000\",".into(),  //default
            "term_color8: \"#767676\",".into(),  //default
            "term_color1: \"#cc0403\",".into(),  //default
            "term_color9: \"#f2201f\",".into(),  //default
            "term_color2: \"#19cb00\",".into(),  //default
            "term_color10: \"#23fd00\",".into(),   //default
            "term_color3: \"#cecb00\",".into(),  //default
            "term_color11: \"#fffd00\",".into(), //default
            "term_color4: \"#0d73cc\",".into(),  //default
            "term_color12: \"#1a8fff\",".into(),   //default
            "term_color5: \"#cb1ed1\",".into(),  //default
            "term_color13: \"#fd28ff\",".into(), //default
            "term_color6: \"#0dcdcd\",".into(),  //default
            "term_color14: \"#14ffff\",".into(),   //default
            "term_color7: \"#dddddd\",".into(),  //default
            "term_color15: \"#ffffff\",".into(), //default
            format!("link: \"{}\",", self.primary_container),
            format!("title: \"{}\",", self.primary),
            format!("key: \"{}\",", self.secondary),
            format!("screen_cast: \"{}\",", self.error),
            format!("screen_cast_unfocused: \"{}\",", self.primary),
            "};".into(),
        ];
        test.join("\n") + "\n"
    }
}

#[derive(Deserialize, Serialize, Debug)]
pub struct Light {
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
