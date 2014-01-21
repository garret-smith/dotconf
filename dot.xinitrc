xmodmap ~/dvorak.xmod
xmodmap ~/caps_esc.xmod
xmodmap ~/leftmouse.xmod

xrdb -merge ~/.Xresources

xscreensaver -nosplash &
statbar | dzen2 -ta l -fn '-*-proggyopti-*-*-*-*-10-*-*-*-*-*-*-*' &
wallpaper
xcompmgr -cCfF -D 5 &
wpchanger &

xmonad

wpchanger stop

