#xmodmap ~/dotconf/dvorak.xmod
xmodmap ~/dotconf/caps_esc.xmod
xmodmap ~/dotconf/leftmouse.xmod

xrdb -merge ~/dotconf/dot.Xresources

xrandr --output DVI-I-3 --off
xrandr --output DVI-I-2 --mode 1920x1080
xrandr --output DVI-I-3 --right-of DVI-I-2 --mode 1920x1200

xscreensaver -nosplash &
statbar | dzen2 -ta l -xs 1 &
#statbar | dzen2 -ta l -xs 2 &
wallpaper
#xcompmgr -cCfF -D 5 &
wpchanger &
synergys &
redshift -l 38.65:-121.12 -t 6000:4000 &

xmonad

wpchanger stop

