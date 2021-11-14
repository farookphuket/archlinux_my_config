#!/bin/bash




HEIGHT=16
WIDTH=45
CHOICE_WIDTH=4
TITLE="Simple logout script"
BACK_TITLE="$USER's simple logout script!"
MENU="What would you like to do? : "

    OPTIONS=(1 "Reboot"
        2 "Shutdown Now"
        3 "Logout")

        CHOICE=$(dialog --clear \
                --backtitle "$BACK_TITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_WIDTH \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

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
