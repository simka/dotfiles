#!/bin/bash
SOUND=$(amixer sget Master | awk -F"[][]" '/Front Left.*%/ { print $4 }')
amixer -q set Master mute
scrot /tmp/screenshot.png
convert /tmp/screenshot.png -blur 0x5 /tmp/screenshotblur.png
i3lock -n -i /tmp/screenshotblur.png && if [ $SOUND = "on" ]; then amixer -q set Master unmute; fi
