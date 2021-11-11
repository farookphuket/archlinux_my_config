#!/bin/bash 


# run script dir 

run_script_dir=~/archlinux_my_config/scripts


# return error message
error() { \
    clear; printf "ERROR:\\n%s\\n" "$1" >&2; exit 1;
}

# ============== install the need program START ===============================


sudo pacman --noconfirm --needed -Sy dialog git || error "Error syncing the repos."



welcome() { \
    dialog --colors --title "Installing script archlinux_my_config!" --msgbox "\Z4This is a script that will install what I sarcastically call archlinux_my_config .  It's really just an installation script for those that want to try out my . dot file  this script will only make it for arch linux DWM edition\\n\\n-Farook " 16 60

    dialog --colors --title "please stay near your computer!" --yes-label "Continue" --no-label "Exit" --yesno "\Z4This script is not allowed to be run as root, but you will be asked to enter your sudo password at various points during this installation. This is to give PACMAN the necessary permissions to install the software.  So stay near the computer.
    \\nThis script will be need 1 hour 45 minute to run it is really depending up on your internet speed." 8 60
}

welcome || error "User choose to exit."




sudo pacman -Syyu

# =========  
sudo pacman -S --needed --noconfirm nodejs npm composer gnome-characters gnome-calculator

# terminal 
sudo pacman -S --needed --noconfirm gnome-terminal konsole 

# ============= setup yay 
sh $run_script_dir/yay.sh



# =========== code editor ,ranger file manager,rsync file compare
sudo pacman -S  --needed  gvim atom code neovim ranger rsync

# ========== screen capture video editor
sudo pacman -S --needed --noconfirm spectacle obs-studio kdenlive soundconverter


# subtitle editor 
sudo pacman -S --needed --noconfirm aegisub 

# mp3 tag editor 
yay -S puddletag-git

# google-chrome
pamac build google-chrome 

# brave browser
yay -S brave-bin 

# opensuse image writer
yay -S imagewriter 


# ============= cmus cannot be install if it found in zsh/site-functions ======
# remove _cmus* 
sudo rm -rf /usr/share/zsh/site-functions/_cmus*

# ============= youtube-dl cannot be install if it found in zsh/site-functions ======
# remove _youtube-dl 
sudo rm -rf /usr/share/zsh/site-functions/_youtube-dl

# gthumb image tools, cmus play song,youtube-dl download video from youtube
sudo pacman -S --needed --noconfirm gthumb cmus youtube-dl

# sticky note
sudo pacman -S --needed --noconfirm xpad knotes

#
sleep 5s

urxvt -e cmus &

# ocenaudio sound editor 
yay -S ocenaudio 


# network-manager-applet
yay -S network-manager-applet 

# pamac-tray 
yay -S pamac-tray-icon-plasma

# install vlc
pamac install vlc


# sound player 
sudo pacman -S  --needed --noconfirm audacious amarok clementine



# install virt-manager 
sh $run_script_dir/virt-manager.sh


# install virtualbox 
sh $run_script_dir/virtualbox.sh


# install libreoffice 
sh $run_script_dir/libre_office.sh



# ========================= Shutter ===========================================
# shutter is the screen capture ,
# shutter will not working if install using pacman 
# last edit 30 Oct 2021
# setup snap  
sh $run_script_dir/snapd.sh 

# then install shutter
sh $run_script_dir/shutter.sh

# =============================================================================
# ============== install the need program END =================================

# ============== copy config file START ======================================= 
tar_dir=~/archlinux_my_config/CONFIG_FILES
config_des_dir=~/.config


# ====== copy vim,neovim,tmux,ranger,powerline config 
cp -r $tar_dir/vim/.vim ~/ 
cp -r $tar_dir/ranger/ ~/.config/ 
cp -r $tar_dir/powerline/ ~/.config/
cp -r $tar_dir/nvim/ ~/.config/

cp $tar_dir/vim/.vimrc ~/
cp $tar_dir/vim/.bashrc ~/
cp $tar_dir/vim/.tmux.conf ~/



# using flag --disable-download-timeout will help in case of slow connection 
sudo pacman -Syyu --disable-download-timeout




# ====== copy dwm config file START ===========================================
old_dwm_config_dir=~/.config/dwm/
if [[ -d $old_dwm_config_dir ]]; then
    mv ~/.config/dwm ~/.config/dwm.old/ 
fi


old_dmenu_config_dir=~/.config/dmenu/
if [[ -d $old_dmenu_config_dir ]]; then
    mv ~/.config/dmenu ~/.config/dmenu.old/ 
fi


old_st_config_dir=~/.config/st/
if [[ -d $old_st_config_dir ]]; then
    mv ~/.config/st ~/.config/st.old/ 
fi

# copy the dwm,dmenu,st config 
cp -r $tar_dir/dwm $config_des_dir
cp -r $tar_dir/dmenu $config_des_dir
cp -r $tar_dir/st $config_des_dir




# ====== copy dwm config file END =============================================


# ====== copy zsh config
pushd ~/

git clone https://gitlab.com/farookphuket/my_zsh.git 

# run the script from ~/my_zsh where just has clone
sh ~/my_zsh/setup_arco.sh


popd

echo "=========================== operation Complete =========================="
echo "current dir is $(pwd)"
echo " logout and log back in to get the new setup effect."
echo "Thank you for using Farook' s config script."
echo " please contact 'farookphuket@gmail.com' to report a problem about this script"
echo ""
echo "========================================================================="



sleep 5s

# ============== copy config file END ========================================= 

fn_googdbye(){
    dialog --colors --title "Operation done!" --msgbox "\Z4The operation has been done \\nPlease restart (you can press Mod+x then select reboot from the menu)" 16 60
    
}

fn_googdbye

