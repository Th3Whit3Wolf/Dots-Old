[[ -f ~/.bashrc ]] && . ~/.bashrc
if [[ -x /usr/bin/chromium ]]; then
    export chrome=/usr/bin/chromium
fi

if [[ -d ~/.cargo/ ]]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

hash go 2>/dev/null
if [ $? -eq 0 ]; then
    export GOPATH="$HOME/.go"
    export PATH="$PATH:$GOPATH/bin"
fi

if hash npm 2>/dev/null
then
    export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/.npm/npmrc"
    export PATH="$PATH:$HOME/.local/lib/node/bin"
fi

if hash cabal 2>/dev/null
then
    export PATH="$PATH:$HOME/.cabal/bin"
fi

if hash dart 2>/dev/null
then
    export PATH="$PATH:$HOME/.pub/bin"
fi

# Necessary for Sway to start
if test -z "${XDG_RUNTIME_DIR}"; then
    export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
    if ! test -d "${XDG_RUNTIME_DIR}"; then
        mkdir "${XDG_RUNTIME_DIR}"
        chmod 0700 "${XDG_RUNTIME_DIR}"
    fi
fi

# Autostart Sway
#if [ "$(tty)" = "/dev/tty1" ]; then
    #	val=$(udevadm info -a -n /dev/dri/card1 | grep boot_vga | rev | cut -c 2)
    #	cmd="WLR_DRM_DEVICES=/dev/dri/card$val sway"
    #	eval "$cmd"
#    WLR_DRM_DEVICES=/dev/dri/card0 sway
#fi