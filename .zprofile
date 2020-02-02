[[ -f ~/.zshrc ]] && . ~/.zshrc
if which chromium >/dev/null 2>&1; then
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

if which npm >/dev/null 2>&1; then
	export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/.npm/npmrc"
	export PATH="$PATH:$HOME/.node_modules/bin:$PAH"
	export npm_config_prefix=~/.node_modules
fi

if which cabal >/dev/null 2>&1; then
	export PATH="$PATH:$HOME/.cabal/bin"
fi

if which dart >/dev/null 2>&1; then
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
if [ "$(tty)" = "/dev/tty1" ]; then
	WLR_DRM_DEVICES=/dev/dri/card0 sway
fi

# Colorful Man Pages
export PAGER=less
export LESS_TERMCAP_mb=$'\E[01;31m'         # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'    # begin bold
export LESS_TERMCAP_me=$'\E[0m'             # end mode
export LESS_TERMCAP_se=$'\E[0m'             # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'      # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'             # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m'   # begin underline

# XDG directories
if [[ -d ~/.config/ ]]; then
	export XDG_CONFIG_HOME="$HOME/.config"
fi

if [[ -d ~/.cache/ ]]; then
	export XDG_CACHE_HOME="$HOME/.cache"
fi

if [[ -d ~/.local/share/ ]]; then
	export XDG_DATA_HOME="$HOME/.local/share"
fi

if [[ -d ~/Dex/ ]]; then
	export XDG_DESKTOP_DIR="$HOME/Dex"
fi

if [[ -d ~/Docs/ ]]; then
	export XDG_DOCUMENTS_DIR="$HOME/Docs"
fi

if [[ -d ~/Downs/ ]]; then
	eexport XDG_DOWNLOAD_DIR="$HOME/Downs"
fi

if [[ -d ~/Tunes/ ]]; then
	export XDG_MUSIC_DIR="$HOME/Tunes"
fi

if [[ -d ~/Pics/ ]]; then
	export XDG_PICTURES_DIR="$HOME/Pics"
fi

if [[ -d ~/Pub/ ]]; then
	export XDG_PUBLICSHARE_DIR="$HOME/Pub"
fi

if [[ -d ~/.ssh/rsa_id/ ]]; then
	export SSH_KEY_PATH="$HOME/.ssh/rsa_id"
fi

if [[ -d ~/Vids/ ]]; then
	export XDG_VIDEOS_DIR="$HOME/Vids"
fi

export EDITOR=nvim
export VISUAL=code-oss
