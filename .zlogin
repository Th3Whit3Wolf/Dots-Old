# Execute code in the background to not affect the current session
{
  # Compile zcompdump, if modified, to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!

#if [[ -z $DISPLAY && $(tty) == /dev/tty1 && ( -z $XDG_SESSION_TYPE || $XDG_SESSION_TYPE == tty )]]; then
#	QT_QPA_PLATFORM=wayland XDG_SESSION_TYPE=wayland exec dbus-run-session gnome-session &> /dev/null
#fi

#[[ -f ~/.zprofile ]] && . ~/.zprofile
