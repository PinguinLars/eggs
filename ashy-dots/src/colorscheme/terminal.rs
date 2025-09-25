use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize,Debug)]
pub struct Hellwal {
    wallpaper: String,
    alpha: String,
    special: Special,
    colors: Colors,
}

impl Hellwal {
    pub fn to_rhai(self) -> String {
        todo!()
    }
}

#[derive(Serialize, Deserialize,Debug)]
pub struct Special {
    background: String,
    foreground: String,
    cursor: String,
    border: String,
}

#[derive(Serialize, Deserialize, Debug)]
pub struct Colors {
    color0: String,
    color1: String,
    color2: String,
    color3: String,
    color4: String,
    color5: String,
    color6: String,
    color7: String,
    color8: String,
    color9: String,
    color10: String,
    color11: String,
    color12: String,
    color13: String,
    color14: String,
    color15: String,
}
