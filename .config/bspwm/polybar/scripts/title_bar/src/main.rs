use xcb;
use xcb_util::{ewmh, icccm};
use std::{thread, time};
fn main() {
    let stop = false;
    while stop != true {
        let (xcb_conn, screen_idx) = xcb::Connection::connect(None).unwrap();
        let ewmh_conn = ewmh::Connection::connect(xcb_conn)
            .map_err(|(e, _)| e)
            .unwrap();
        let win = ewmh::get_active_window(&ewmh_conn, screen_idx).get_reply();
        let win: u32 = if win.is_ok() { win.unwrap() } else { 0 };
        if win == 0 {
            println!("%{{F#686868}}%{{T2}} %{{T-}}%{{F-}}bspwm%{{F-}}")
        } else {
            let wm_class = icccm::get_wm_class(&ewmh_conn, win).get_reply().unwrap();
            match wm_class.class() {
                "Atom" => println!("{{T2}} %{{T-}}%{{F-}}Atom"),
                "brave-browser" => println!("%{{F#5D4D7A}}%{{T2}} %{{T-}}%{{F-}}brave"),
                "code-oss" => println!("%{{F#5D4D7A}}%{{T2}}﬏ %{{T-}}%{{F-}}vscode"),
                "firefox" => println!("%{{F#5D4D7A}}%{{T2}} %{{T-}}%{{F-}}Firefox"),
                "font-manager" => println!("%{{F#5D4D7A}}%{{T2}}ﯔ %{{T-}}%{{F-}}font manager"),
                "kitty" => println!("%{{F#5D4D7A}}%{{T2}} %{{T-}}%{{F-}}kitty"),
                "gimp-2.10" => println!("%{{F#5D4D7A}}%{{T2}} %{{T-}}%{{F-}}gimp"),
                "google-chrome" => println!("%{{F#5D4D7A}}%{{T2}} %{{T-}}%{{F-}}chrome"),
                "Gnome-podcasts" => println!("%{{F#5D4D7A}}%{{T2}} %{{T-}}%{{F-}}Gnome Podcasts"),
                "gpartedbin" => println!("%{{F#5D4D7A}}%{{T2}} %{{T-}}%{{F-}}gparted"),
                "lxappearance" => println!("%{{F#5D4D7A}}%{{T2}} %{{T-}}%{{F-}}lxappearance"),
                "mail" => println!("%{{F#5D4D7A}}%{{T2}} %{{T-}}%{{F-}}email"),
                "neovim" => println!("%{{F#5D4D7A}}%{{T2}} %{{T-}}%{{F-}}vim"),
                "nitrogen" => println!("%{{F#5D4D7A}}%{{T2}} %{{T-}}%{{F-}}nitrogen"),
                "polkit-gnome-authentication-agent-1" => println!("%{{F#5D4D7A}}%{{T2}} %{{T-}}%{{F-}}password"),
                "Spotify" => println!("%{{F#5D4D7A}}%{{T2}} %{{T-}}%{{F-}}Spotify"),
                "steam" => println!("%{{F#5D4D7A}}%{{T2}} %{{T-}}%{{F-}}steam"),
                "thunar" => println!("%{{F#5D4D7A}}%{{T2}} %{{T-}}%{{F-}}thunar"),
                "Thunar" => println!("%{{F#5D4D7A}}%{{T2}} %{{T-}}%{{F-}}Thunar"),
                "thunderbird" => println!("%{{F#5D4D7A}}%{{T2}} %{{T-}}%{{F-}}email"),
                "timeshift-gtk" => println!("%{{F#5D4D7A}}%{{T2}} %{{T-}}%{{F-}}timeshift"),
                _ => println!("%{{F#5D4D7A}}%{{T2}}{} %{{T-}}%{{F-}}", wm_class.class()),
            }
            let hundred_millis = time::Duration::from_millis(100);
            thread::sleep(hundred_millis);
        }
    }
}
