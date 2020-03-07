use xcb;
use xcb_util::{ewmh, icccm};
use std::{thread, time};

const ICON_COLOR: &'static str = "#5D4D7A";
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
                "Alacritty" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Alacritty", ICON_COLOR),
                "Atom" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Atom", ICON_COLOR),
                "brave-browser" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Brave", ICON_COLOR),
                "code-oss" => println!("%{{F{}}}%{{T2}}﬏ %{{T-}}%{{F-}}VS Code", ICON_COLOR),
                "Chromium" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Chromium", ICON_COLOR),
                "Deluge-gtk" => println!("%{{F{}}}%{{T2}}﨩 %{{T-}}%{{F-}}Deluge", ICON_COLOR),
                "dolphin" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Dolphin", ICON_COLOR),
                "Electron" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Electron", ICON_COLOR),
                "firefox" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Firefox", ICON_COLOR),
                "font-manager" => println!("%{{F{}}}%{{T2}}ﯔ %{{T-}}%{{F-}}Font Manager", ICON_COLOR),
                "htop" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Htop", ICON_COLOR),
                "Io.github.celluloid_player.Celluloid" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Celluloid", ICON_COLOR),
                "kcolorchooser" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}KDE Color Chooser", ICON_COLOR),
                "kitty" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Kitty", ICON_COLOR),
                "Kodi" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Kodi", ICON_COLOR),
                "Gcolor3" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Gnome ICON_COLOR Picker", ICON_COLOR),
                "gotop" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Gotop", ICON_COLOR),
                "gimp-2.10" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Gimp", ICON_COLOR),
                "google-chrome" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Chrome", ICON_COLOR),
                "Gnome-podcasts" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Gnome Podcasts", ICON_COLOR),
                "gpartedbin" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Gparted", ICON_COLOR),
                "lxappearance" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}LX Appearance", ICON_COLOR),
                "Lollypop" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Lollypop", ICON_COLOR),
                "mail" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Email", ICON_COLOR),
                "mpv" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}MPV", ICON_COLOR),
                "neovim" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Neovim", ICON_COLOR),
                "nitrogen" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Nitrogen", ICON_COLOR),
                "Parole" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Parole", ICON_COLOR),
                "partitionmanager" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}KDE Partition Manager", ICON_COLOR),
                "polkit-gnome-authentication-agent-1" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Password", ICON_COLOR),
                "Spotify" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Spotify", ICON_COLOR),
                "steam" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Steam", ICON_COLOR),
                "thunar" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Thunar", ICON_COLOR),
                "Thunar" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Thunar", ICON_COLOR),
                "Typora" => println!("%{{F{}}}%{{T2}}龎 %{{T-}}%{{F-}}Typora", ICON_COLOR),
                "thunderbird" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Thunderbird", ICON_COLOR),
                "timeshift-gtk" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Timeshift", ICON_COLOR),
                "UXTerm" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Terminal", ICON_COLOR),
                "updates" => println!("%{{F{}}}%{{T2}}ﮮ %{{T-}}%{{F-}}Running Updates", ICON_COLOR),
                "Xfce4-terminal" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Terminal", ICON_COLOR),
                "XTerm" => println!("%{{F{}}}%{{T2}} %{{T-}}%{{F-}}Terminal", ICON_COLOR),
                _ => println!("{}", wm_class.class()),
            }
            let hundred_millis = time::Duration::from_millis(100);
            thread::sleep(hundred_millis);
        }
    }
}
