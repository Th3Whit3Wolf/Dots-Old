dbus-monitor --session "type='signal',interface='org.freedesktop.ScreenSaver'" |
  while read x; do
    case "$x" in 
      # You can call your desired script in the following line instead of the echo:
      *"boolean true"*) ;; #echo SCREEN_LOCKED;;
      *"boolean false"*) bspc wm -r;; #echo SCREEN_UNLOCKED;;  
    esac
  done
