mod color_mode;
mod dark;
mod light;

use crate::colorscheme::color_mode::ColorMode;
use crate::colorscheme::dark::Dark;
use crate::colorscheme::light::Light;
use serde::{Deserialize, Serialize};

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
