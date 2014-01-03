xmodmap ~/dvorak.xmod
xmodmap ~/caps_esc.xmod
xmodmap ~/leftmouse.xmod

xrdb -merge ~/.Xresources

xscreensaver -nosplash &
statbar | dzen2 -ta l -fn '-*-proggyopti-*-*-*-*-10-*-*-*-*-*-*-*' &
feh --bg-fill ~/wallpaper/nature-wallpaper-6.jpg
#hsetroot -solid "#222222"
#xcompmgr -cCfF -D 8 &
xcompmgr &
exec xmonad

