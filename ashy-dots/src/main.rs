mod colorscheme;

use crate::colorscheme::Colorscheme;
use std::fs::File;
use std::io::Write;
use std::path::Path;
use std::{io::Error, process::Command};

fn main() -> Result<(), Error> {
    let mut yolk = Command::new("sh");
    yolk.args(["-c", "yolk eval 'data.dynamic_colors'"]);
    let out = String::from_utf8(yolk.output()?.stdout).unwrap();
    if out != "true\n" {
        println!("{out}");
        println!("Returning early");
        return Ok(());
    }
    let mut matugen = Command::new("sh");
    matugen.args([
        "-c",
        //"matugen image ~/.config/share/wallpapers/picnic.png --json hex",
        "matugen image ~/.config/share/wallpapers/weeb.png --json hex",
    ]);
    let json = String::from_utf8(matugen.output()?.stdout).unwrap();
    let output: Colorscheme = serde_json::from_str(&json)?;
    let yolk_dir = match std::env::var("YOLK_DIR") {
        Ok(val) => val.into(),
        Err(_) => match std::env::home_dir() {
            None => panic!("No home directory"),
            Some(home) => home.join(".config").join("yolk"),
        },
    };
    let file_path = Path::new(&yolk_dir).join("dynamic.rhai");
    let mut file = File::create(file_path)?;
    file.write_all(output.to_rhai().as_bytes())?;
    Ok(())
}
