xmodmap ~/dvorak.xmod
xmodmap ~/caps_esc.xmod
xmodmap ~/leftmouse.xmod

#xrandr --output DVI-0 --mode 1920x1080
#xrandr --output VGA-0 --mode 1600x1200 --left-of DVI-0

xrandr --output DVI-0 --left-of VGA-0
xrandr --output VGA-0 --left-of DVI-0

if [ "$WM" = "KDE" ]; then
	startkde4
else
	xscreensaver -nosplash &
	statbar | dzen2 -ta l -fn '-*-proggyopti-*-*-*-*-10-*-*-*-*-*-*-*' -xs 2 &
	statbar | dzen2 -ta l -fn '-*-proggyopti-*-*-*-*-10-*-*-*-*-*-*-*' -xs 1 &
	exec xmonad
fi

