#!/bin/bash




HEIGHT=16
WIDTH=45
CHOICE_WIDTH=4
TITLE="Simple logout script"
BACK_TITLE="$USER's simple logout script!"
MENU="What would you like to do? $USER: "

    OPTIONS=(1 "Reboot"
        2 "Shutdown Now"
        3 "Logout")
        
        CHOICE=$(dialog --clear \
            --title "$TITLE" \
            --backtitle "$BACK_TITLE" \
            --menu "$MENU" \
            $HEIGHT $WIDTH $CHOICE_WIDTH  \
            2>&1 >/dev/tty \
            "${OPTIONS[@]}")

            clear
            case $CHOICE in
                1) 
                    reboot
                    ;;
                2) 
                    shutdown now
                    ;;
                3) 
                    killall dwm
                        ;;
            esac
