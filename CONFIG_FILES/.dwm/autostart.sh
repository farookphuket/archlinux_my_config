#!/bin/bash


function run(){
	if ! pgrep $1 ;
	then
		$@&
	fi
}


run "pa-applet"

run "nm-applet"

run "blueman-tray"

run "pamac-tray"

run "xfce4-power-manager"

run "picom"

# 13 Apr 2022
run "birdtray"

run "/usr/lib/xfce4/notifyd/xfce4-notifyd"

run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"

run "numlockx on"

run "conky -c $HOME/.config/dwm/conky/system-overview"

feh --bg-fill --randomize ~/Pictures/wallpapers/* &


run slstatus & 
run ~/.config/dwm/custom_script/set_kb.sh &

run ~/.config/dwm/custom_script/set_vm_screen.sh &

sxhkd -c ~/.config/dwm/sxhkd/sxhkdrc &
