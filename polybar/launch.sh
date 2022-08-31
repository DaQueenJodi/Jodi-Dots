#/bin/sh

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini
MONITOR=HDMI-A-3 polybar secondary 2>&1 | tee -a /tmp/polybar.log & disown
MONITOR=DVI-D-0 polybar primary 2>&1 | tee -a /tmp/polybar.log & disown
echo "Polybar launched..."
