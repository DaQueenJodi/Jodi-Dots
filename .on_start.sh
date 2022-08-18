# start sxhkd using dash as the shell to greatly speed up hotkey delay
killall sxhkd
SXHKD_SHELL=/bin/dash sxhkd & 

# auto correct monitors because yeah
bspwm_correct_monitors
# launch pipewire since no systemd
killall pipewire
/usr/bin/gentoo-pipewire-launcher &
# make cursor not shit
xsetroot -cursor_name left_ptr
# start compositor
killall picom
picom --experimental-backend &
# set wallpaper
nitrogen --restore &
# launch polybar
killall polybar
$HOME/.config/polybar/launch.sh &
# launch clipboard manager
killall xfce4-clipman
xfce4-clipman &

# fix java apps not loading under some window managers
export _JAVA_AWT_WM_NONREPARENTING=1
