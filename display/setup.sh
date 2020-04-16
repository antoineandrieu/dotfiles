#!/bin/bash
intern=eDP-1
extern=DP-2-2

if xrandr | grep "$extern disconnected"; then
    xrandr --output "$extern" --off --output "$intern" --auto
else
    xrandr --output "$intern" --off --output "$extern" --primary --mode 3440x1440 --pos 0x0 --rotate normal
fi
