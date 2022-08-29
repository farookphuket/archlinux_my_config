#!/bin/bash


# run script dir

run_script_dir=~/archlinux_my_config/scripts


# return error message
error() { \
    clear; printf "ERROR:\\n%s\\n" "$1" >&2; exit 1;
}

# ============== install the need program START ===============================


sudo pacman  -S dialog git --needed --noconfirm  || error "Error syncing the repos."



welcome() { \
    dialog --colors --title "\Z0 Installing script archlinux_my_config!" --msgbox "\Z4This is a script that will install what I sarcastically call archlinux_my_config .  It's really just an installation script for those that want to try out my . dot file  this script will only make it for arch linux which will use DWM window manager \\n\\n-Farook " 16 60

    dialog --colors --title "please stay near your computer!" --yes-label "Continue" --no-label "Exit" --yesno "\Z4This script is not allowed to be run as root, but you will be asked to enter your sudo password at various points during this installation. This is to give PACMAN the necessary permissions to install the software.  So stay near the computer.
    \\nThis script will be need 3 hours to run it is really depending up on your internet speed." 14 60
}

welcome || error "User choose to exit."

current_dwm=~/.config/dwm 

function isExistDWM(){
    if [ -d $current_dwm ] 
    then
        msg_box="\Z1Dear $USER we found your current dwm config.\\nyour current dwm config will be now renamed to \\n~/.config/dwm_old  \\n\\n-Farook"
        dialog --colors --title "\Z0 found dwm config!" --msgbox "$msg_box" 16 60
        mv $current_dwm ~/.config/dwm_old
        echo " - your current dwm config has been renamed to dwm_old"
    fi
}

isExistDWM



sudo pacman -Syyu --disable-download-timeout


# ============= setup yay
sh $run_script_dir/yay.sh


# ========================= Shutter ===========================================
# shutter is the screen capture ,
# shutter will not working if install using pacman
# last edit 30 Oct 2021
# setup snap
sh $run_script_dir/snapd.sh


sh $run_script_dir/call_script.sh

# =============================================================================
# ============== install the need program END =================================

# ============== copy config file START =======================================
tar_dir=~/archlinux_my_config/CONFIG_FILES
config_des_dir=~/.config


# ====== copy vim,neovim,tmux,ranger,powerline config
cp -r $tar_dir/VIM/.vim ~/
cp -r $tar_dir/ranger/ ~/.config/
cp -r $tar_dir/powerline/ ~/.config/


# copy the nvim config from chrisatmachine
# cp -r $tar_dir/nvim/ ~/.config/
# copy nvim config to ~/.config
# cp -r $tar_dir/nvim-2022/nvim ~/.config/

# copy the nvim config which is use AstroNvim on the 26 Aug 2022 
cp -r $tar_dir/AstroNvim/nvim/ $config_des_dir/


cp $tar_dir/VIM/.vimrc ~/
cp $tar_dir/.bashrc ~/
cp $tar_dir/.tmux.conf ~/
cp $tar_dir/.Xresources ~/



# touchpad click able 12 Jan 2021 use "2 tap for right click"
sudo pacman -Syu xf86-input-libinput
sudo cp $tar_dir/30-touchpad.conf /etc/X11/xorg.conf.d/
sudo cp $tar_dir/10-synaptics.conf /etc/X11/xorg.conf.d/

# this line fix the problem "Cannot use mouse click when using a multiple 
# screen for the laptop" on 2 Mar 2022
sudo cp $tar_dir/psmouse.conf /etc/modprobe.d/


# using flag --disable-download-timeout will help in case of slow connection
sudo pacman -Syyu --disable-download-timeout










# ====== copy zsh config
pushd ~/

git clone https://gitlab.com/farookphuket/my_zsh.git

# run the script from ~/my_zsh where just has clone
sh ~/my_zsh/setup.sh


popd




sleep 5s

# ============== copy config file END =========================================

fn_goodbye(){
    dialog --colors \
        --title "Operation done!" \
        --msgbox "\Z4The operation has been done!
            \\nThe change will take an effect in the next boot." \
                16 60

}

fn_goodbye

