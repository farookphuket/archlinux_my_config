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


run "/usr/lib/xfce4/notifyd/xfce4-notifyd"

run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"

run "numlockx on"

run "conky -c $HOME/.config/dwm/system-overview"

feh --bg-fill --randomize ~/Pictures/wallpapers/* &


run slstatus & 
run ~/.config/dwm/set_kb.sh &

sxhkd -c ~/.config/dwm/sxhkd/sxhkdrc &
