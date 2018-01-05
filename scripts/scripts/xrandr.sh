#!/usr/bin/env sh

if [[ $(xrandr | grep DP-1) ]]; then
  # work
  xrandr --output DP-1 --auto --output DP-2 --auto --left-of DP-1
else
  # home
  xrandr --output HDMI-2 --auto
fi
