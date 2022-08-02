# launch pipewire since no systemd
/usr/bin/gentoo-pipewire-launcher &
# make cursor not shit
xsetroot -cursor_name left_ptr
# start compositor
killall picom
picom &
# set wallpaper
nitrogen --restore &
# launch polybar
$HOME/.config/polybar/launch.sh &
# launch clipboard manager
killall xfce4-clipman
xfce4-clipman &

# fix java apps not loading under some window managers
export _JAVA_AWT_WM_NONREPARENTING=1
