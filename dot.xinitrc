xmodmap ~/dotconf/dvorak.xmod
xmodmap ~/dotconf/caps_esc.xmod
xmodmap ~/dotconf/leftmouse.xmod

xrdb -merge ~/dotconf/dot.Xresources

xrandr --output HDMI2 --right-of VGA1 --mode 1920x1200
xrandr --output VGA1 --left-of HDMI2 --mode 1600x1200

xscreensaver -nosplash &
statbar | dzen2 -ta l -xs 1 &
statbar | dzen2 -ta l -xs 2 &
wallpaper
#xcompmgr -cCfF -D 5 &
wpchanger &

xmonad

wpchanger stop

