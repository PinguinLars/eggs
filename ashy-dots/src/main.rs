mod colorscheme;

use crate::colorscheme::{Colorscheme, combine_colorschemes, terminal::Hellwal};
use std::{
    env,
    fs::File,
    io::{Error, Write},
    path::Path,
    process::Command,
};

#[allow(unreachable_code)]
fn main() -> Result<(), Error> {
    let mut args = env::args();
    let _executable = args.next();
    let wallpaper_path = match args.next() {
        Some(path_raw) => path_raw,
        None => panic!("No wallpaper path"),
    };
    let term_dark = serde_json::from_str::<Hellwal>(&run_hellwal(&wallpaper_path, true)?)?;
    let term_light = serde_json::from_str::<Hellwal>(&run_hellwal(&wallpaper_path, false)?)?;
    let json = run_matugen(&wallpaper_path)?;
    let output: Colorscheme = serde_json::from_str(&json)?;
    println!("{}", combine_colorschemes(output, term_dark, term_light));
    return Ok(());
    let yolk_dir = match env::var("YOLK_DIR") {
        Ok(val) => val.into(),
        Err(_) => match env::home_dir() {
            None => panic!("No home directory"),
            Some(home) => home.join(".config").join("yolk"),
        },
    };
    let file_path = Path::new(&yolk_dir).join("dynamic.rhai");
    let mut file = File::create(file_path)?;
    let file_contents = output.to_rhai();
    file.write_all(file_contents.as_bytes())?;
    Ok(())
}

fn run_matugen(wallpaper_path: &str) -> Result<String, Error> {
    let mut matugen = Command::new("sh");
    matugen.args(["-c", &format!("matugen image {wallpaper_path} --json hex")]);
    Ok(String::from_utf8(matugen.output()?.stdout).unwrap())
}

fn run_hellwal(wallpaper_path: &str, dark: bool) -> Result<String, Error> {
    let mut hellwal = Command::new("sh");
    hellwal.args([
        "-c",
        &format!(
            "hellwal --image {wallpaper_path} --json --skip-term-colors {}",
            if dark { "-d" } else { "-l" }
        ),
    ]);
    Ok(String::from_utf8(hellwal.output()?.stdout).unwrap())
}
