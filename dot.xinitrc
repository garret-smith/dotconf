#xmodmap ~/dotconf/dvorak.xmod
xmodmap ~/dotconf/caps_esc.xmod
xmodmap ~/dotconf/leftmouse.xmod

xrdb -merge ~/dotconf/dot.Xresources

#xrandr --output HDMI2 --right-of VGA1 --mode 1920x1200
#xrandr --output VGA1 --left-of HDMI2 --mode 1600x1200
#xrandr --output DVI-I-1 --right-of DVI-D-0
#xrandr --output DVI-D-0 --left-of DP-1
xrandr --output DP-1 --left-of DVI-I-1 --mode 2560x1440
xrandr --output DVI-I-1 --right-of DP-1 --mode 1920x1200
#xrandr --output HDMI-0 --right-of DVI-D-0 --left-of DVI-I-1

xscreensaver -nosplash &
#statbar | dzen2 -ta l -xs 1 &
statbar | dzen2 -dock -ta l -xs 2 &
#xcompmgr -cCfF -D 5 &
wpchanger &
synergy-core --server &
redshift -l 38.54:-121.27 -t 6500:3600 &

xmonad

wpchanger stop

