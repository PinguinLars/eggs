//! Module to get a random wallpaper

use rand::Rng;
use std::ffi::OsStr;
use std::fs::ReadDir;
use std::path::PathBuf;
use std::{env, fs};

pub fn get_random_wallpaper() -> PathBuf {
    let mut rng = rand::rng();
    let wallpapers_dir = env::home_dir()
        .expect("No home directory")
        .join(".config")
        .join("share")
        .join("wallpapers");
    let mut wallpapers: Vec<PathBuf> = Vec::new();
    let mut dirs =
        vec![fs::read_dir(&wallpapers_dir).expect("Could not read wallpapers directory")];
    loop {
        let dir = match dirs.pop() {
            None => break,
            Some(dir) => dir,
        };
        let (goten_wallpapers, nested_dirs) = get_wallpapers_in_dir_and_nested_dirs(dir);
        wallpapers.extend(goten_wallpapers);
        if nested_dirs.is_some() {
            //SAFETY: nested_dirs can only be some in this block!
            let nested_dirs = unsafe { nested_dirs.unwrap_unchecked() };
            let nested_dirs = nested_dirs
                .into_iter()
                .map(|x| fs::read_dir(x).unwrap())
                .collect::<Vec<_>>();
            dirs.extend(nested_dirs);
        }
    }
    let random_index = rng.random_range(0..wallpapers.len());
    dbg!(&wallpapers);
    wallpapers[random_index].clone()
}

fn get_wallpapers_in_dir_and_nested_dirs(
    wallpaper_dir: ReadDir,
) -> (Vec<PathBuf>, Option<Vec<PathBuf>>) {
    let mut nested_dirs: Vec<PathBuf> = Vec::new();
    let uwu = wallpaper_dir
        .map(|x| x.unwrap())
        .filter(|x| {
            if !x.file_type().unwrap().is_file() {
                nested_dirs.push(x.path());
                false
            } else {
                true
            }
        })
        .filter(|x| {
            let binding = x.path();
            let x = binding.extension().unwrap();
            x == OsStr::new("jpg") || x == OsStr::new("png") || x == OsStr::new("jpeg")
        })
        .map(|x| x.path())
        .collect::<Vec<_>>();
    if nested_dirs.is_empty() {
        (uwu, None)
    } else {
        (uwu, Some(nested_dirs))
    }
}
