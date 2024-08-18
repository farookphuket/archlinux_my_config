#!/bin/bash

function run() {
	if ! pgrep $1; then
		$@ &
	fi
}

run "pa-applet"

run "nm-applet"

run "blueman-tray"

run "pamac-tray"

run "xfce4-power-manager"

run "picom"

run "birdtray"

run "knotes"

run "/usr/lib/xfce4/notifyd/xfce4-notifyd"

run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"

run "numlockx on"

run "conky -c $HOME/.config/dwm/conky/system-overview"

feh --bg-fill --randomize ~/Pictures/wallpapers/* &

run slstatus &
run ~/.config/dwm/custom_script/set_kb.sh &

#run ~/.config/dwm/custom_script/set_vm_screen.sh &

sxhkd -c ~/.config/dwm/sxhkd/sxhkdrc &

# for my laptop Asus last update 25 Aug 2022 only
# please check the file ~/.config/dwm/scripts/2screens.sh
# run ~/.config/dwm/scripts/2screens.sh &

run ~/.config/dwm/scripts/2left_screens.sh &
