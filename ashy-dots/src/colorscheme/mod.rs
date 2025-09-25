mod color_mode;
mod dark;
mod light;
pub mod terminal;

use crate::colorscheme::color_mode::ColorMode;
use crate::colorscheme::dark::Dark;
use crate::colorscheme::light::Light;
use crate::colorscheme::terminal::Hellwal;
use serde::{Deserialize, Serialize};
use std::ops::Add;

#[derive(Deserialize, Serialize, Debug)]
#[allow(non_camel_case_types)]
pub enum Colorscheme {
    colors { dark: Dark, light: Light },
}

impl Colorscheme {
    pub fn to_rhai(self) -> String {
        let (dark, light) = match self {
            Colorscheme::colors { dark, light } => (dark, light),
        };
        light.to_rhai_table() + &*dark.to_rhai_table()
    }
}

pub fn combine_colorschemes(
    colorscheme: Colorscheme,
    terminal_colorscheme_dark: Hellwal,
    terminal_colorscheme_light: Hellwal,
) -> String {
    let (dark, light) = match colorscheme {
        Colorscheme::colors { dark, light } => (dark, light),
    };

    let raw_dark = dark.to_rhai_table();
    let raw_light = light.to_rhai_table();
    let mut colorscheme_dark = raw_dark.lines();
    let mut colorscheme_light = raw_light.lines();

    let mut result:Vec<String> = Vec::new();
    let end_dark = colorscheme_dark.next_back().unwrap();
    for i in colorscheme_dark {
        result.push(i.into());
    }
    result.push(terminal_colorscheme_dark.to_rhai());
    result.push(end_dark.into());

    let end_light = colorscheme_light.next_back().unwrap();
    for i in colorscheme_light {
        result.push(i.into());
    }
    result.push(end_light.into());

    result.join("\n")
}
