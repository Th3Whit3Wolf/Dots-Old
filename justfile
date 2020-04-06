
# Install
install:
#!/bin/bash
    if [[ -v XDG_CONFIG_HOME ]]; then
        cp -r .config/* $XDG_CONFIG_HOME/
    else
        cp -r .config/* $HOME/.config
    fi
    
    if [[ -v XDG_DATA_HOME ]]; then
        cp -r .local/share/* $XDG_DATA_HOME/
    else
        cp -r .local/share/* $HOME/.local/share/
    fi

    cp -r .hp-zola $HOME/
    cp -r .icons $HOME/
    cp -r .shell $HOME/
    cp -r .themes $HOME/
    cp -r Pics/Wallpaper $HOME/Pics
    cp .z* $HOME/
    sudo cp Systmed/* /etc/systemd/system
    sudo cp -r Sddm/themes/* /usr/share/sddm/themes/
    sudo cp -r Plasmoids/ /usr/share/plasma/plasmoids
