xmodmap ~/dvorak.xmod
xmodmap ~/caps_esc.xmod
xmodmap ~/leftmouse.xmod

xrdb -merge ~/.Xresources

xscreensaver -nosplash &
statbar | dzen2 -ta l -fn '-*-proggyopti-*-*-*-*-10-*-*-*-*-*-*-*' -xs 2 &
statbar | dzen2 -ta l -fn '-*-proggyopti-*-*-*-*-10-*-*-*-*-*-*-*' -xs 1 &
exec xmonad

