#!/bin/bash

# noto font
sudo pacman -S --needed --noconfirm noto-fonts noto-fonts-extra nerd-fonts

# more font
yay -S urxvt-resize-font-git ttf-ubuntu-font-family otf-font-awesome ttf-font-awesome ttf-ms-fonts

pushd ~/

git clone https://gitlab.com/farookphuket/my_fonts.git

sleep 5s

cd ~/my_fonts/FONTS/

font_source_dir=~/my_fonts/FONTS/
font_target_dir=/usr/share/fonts/

sudo cp -r $font_source_dir/Nerd_font/ $font_target_dir
sudo cp -r $font_source_dir/TH-FONT/ $font_target_dir
sudo cp -r $font_source_dir/Hack/ $font_target_dir
sudo cp -r $font_source_dir/3270/ $font_target_dir

popd

sudo fc-cache -vf

sleep 5s

## delete font dir as no longer need
my_font=~/my_fonts

if [ -d "$my_font" ]; then
	sudo rm -rf $my_font
fi

# sudo pacman -S --needed --noconfirm dialog

TITLE="Success! your font has been install"
back_title="$USER please reboot your machine"
body_msg="dear $USER your font has been installed! you may have to reboot your system now"

dialog --clear --title "$TITLE" --backtitle "$back_title" --msgbox "$body_msg" 16 45
