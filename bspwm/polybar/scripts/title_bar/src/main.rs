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
            println!("%{{F#686868}}%{{T2}} %{{T-}}bspwm%{{F-}}")
        } else {
            let wm_class = icccm::get_wm_class(&ewmh_conn, win).get_reply().unwrap();
            match wm_class.class() {
                "Atom" => println!("%{{T2}} %{{T-}}Atom"),
                "brave-browser" => println!("%{{T2}} %{{T-}}brave"),
                "code-oss" => println!("%{{T2}}﬏ %{{T-}}vscode"),
                "firefox" => println!("%{{T2}} %{{T-}}Firefox"),
                "font-manager" => println!("%{{T2}}ﯔ %{{T-}}font manager"),
                "kitty" => println!("%{{T2}} %{{T-}}kitty"),
                "gimp-2.10" => println!("%{{T2}} %{{T-}}gimp"),
                "google-chrome" => println!("%{{T2}} %{{T-}}chrome"),
                "Gnome-podcasts" => println!("%{{T2}} %{{T-}}Gnome Podcasts"),
                "gpartedbin" => println!("%{{T2}} %{{T-}}gparted"),
                "lxappearance" => println!("%{{T2}} %{{T-}}lxappearance"),
                "mail" => println!("%{{T2}} %{{T-}}email"),
                "neovim" => println!("%{{T2}} %{{T-}}vim"),
                "nitrogen" => println!("%{{T2}} %{{T-}}nitrogen"),
                "polkit-gnome-authentication-agent-1" => println!("%{{T2}} %{{T-}}password"),
                "Spotify" => println!("%{{T2}} %{{T-}}Spotify"),
                "steam" => println!("%{{T2}} %{{T-}}steam"),
                "thunar" => println!("%{{T2}} %{{T-}}thunar"),
                "Thunar" => println!("%{{T2}} %{{T-}}Thunar"),
                "thunderbird" => println!("%{{T2}} %{{T-}}email"),
                "timeshift-gtk" => println!("%{{T2}} %{{T-}}timeshift"),
                _ => println!("%{{T2}}{} %{{T-}}", wm_class.class()),
            }
            let hundred_millis = time::Duration::from_millis(100);
            thread::sleep(hundred_millis);
        }
    }
}
