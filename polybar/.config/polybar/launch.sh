#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar according to current env
if [[ $(xrandr | grep DP-1) ]]; then
    polybar work
else
    polybar default
fi

echo "polybar launched"
