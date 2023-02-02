#!/bin/sh

# PLEASE NOTE !!
# the command xrandr only un-comment at 1 in a time

# setup for 2 screens 
# laptop screen on the right last update 3 Feb 2023
xrandr --output eDP-1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal

# setup for 2 screens 
# laptop screen on the left last update 3 Feb 2023
# xrandr  --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 1920x0 --rotate normal 

# only 1 screen un-comment this line
# xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal
