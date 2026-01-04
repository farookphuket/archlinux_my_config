# archlinux_my_config


> my config for arch linux

> I just start to using Arch Linux on 10 Nov 2021 
> up until now 26 May 2024 I have to admit that 
> ***Arch linux*** is my favour Linux that I will love to use of all time.




# my last update 

## VIM config copy from Tony
> 5 Jan 2026 copy vim config from Tony youtube
> `https://www.youtube.com/watch?v=-5lb_jLQmKc` 
> the `.vimrc` file now only 1 line 
> `source ~/.vim/.vimrc`


## `vlc can't play h264` has fixed
> 16 Aug 2025 I cannot play video that has .h264 
> and it can be fix by run command 

```
yay -Sy vlc-plugin-ffmpeg 

## OR 

sudo pacman -S --needed vlc-plugins-all

```



> `https://bbs.archlinux.org/viewtopic.php?id=306853`

## I am too lazy 
> so I tried to learn to use the script to manage thing more 
> edit the `.zshrc` and `.bashrc` file to automatic update by typing `upPac`
> will be equal to `sudo pacman -Syu --needed --noconfirm`
> to find and replace word under cursor in vim ",$s/old-word/replace-word" 

--- 

## change script for second left screen 
> the file is `system-overview` for conky `autostart.sh` for .dwm 
> `2left_screens.sh` for the display 

---

## 26 Oct 2024 
> install yazi file manager and update the alacritty.config to fix 
> font problem

## install nerd-fonts 18 Jul 2024 
> by run `sudo pacman -S nerd-fonts` so it's give the nvim look nicer.
> setup neo vim copy the config from Lazyvim to use this config run

```
## remove the old config
 rm -rf ~/.config/nvim/
## copy the config nvim folder to ~/.config/
cp -r nvim_use_19-jul-2024 ~/.config/nvim/
```



[nvim_18-jul-2024]:https://ia601401.us.archive.org/7/items/arch_linux_myconfig_24-aug-2022_edit/nvim_18-jul-2024.png
![Nv][nvim_18-jul-2024]




## added PostMan for test the laravel 11 on 26 May 2024
> the script name web_dev_tools.sh 

[postman_1_img]:https://ia601401.us.archive.org/7/items/arch_linux_myconfig_24-aug-2022_edit/postman_img_1.png
![PostMan][postman_1_img]






## last use 6 Apr 2024 
> install lamp server in arch linux is still work fine.
> copy nvim config from `src/neovim-lazy-ide-2024/.config/nvim/lua/plugins` 
> `https://github.com/agalea91/zazencodes-youtube/tree/main/src/neovim-lazy-ide-2024/.config/nvim/lua/plugins`

create new folder in `.config` 
    nvim/lua/plugins/

## update on 28 Feb 2024 
> due to the error from my tmux config file so I copy the new tmux config file from 
> `# https://hamvocke.com/blog/a-guide-to-customizing-your-tmux-conf/`
> and make a small change to suit my need 

<!-- var image define -->

<!-- plugin update for vim -->
[tailwind_plug]:https://archive.org/download/arch_linux_myconfig_24-aug-2022_edit/tailwindcss_1-sep-2022.png

---







## my config on 24 Aug 2022 

> just for arch linux DWM only!




[arch_linux_my_config]:https://archive.org/download/arch_linux_myconfig_24-aug-2022_edit/arch_linux_myconfig_24-aug-2022_edit.png

![my config][arch_linux_my_config]
















# Warning this config for arch linux DWM ONLY!! 

> this is all just my config when I using arch linux and I am using DWM only

> before you run the command make sure you have a time to be always 
> sit next to your computer as you have to type your password and press 
> confirm for many many(at least 10 times) time on the installation so please pay attention of what you're doing.





## ============== to install this  

> to run setup type the below command in your terminal .

```
cd ~/ 
git clone https://github.com/farookphuket/archlinux_my_config.git 
cd ~/archlinux_my_config 
sh setup.sh

```
> the above command will do :

1. change the working dir to `Home` 
2. clone the code from the repo 
3. change the working dir to `~/archlinux_my_config`
4. run setup.sh to start the installation 



> OR you type them all in one line : 

> `cd ~/ && git clone https://github.com/farookphuket/archlinux_my_config.git && cd ~/archlinux_my_config && sh setup.sh` 

> make sure you accept them all otherwise the script will do nothing!.




## ============== Warning! ===============================

> this code will install all the program that I(Farook) using it in my real life 
work the install time will be really depending up on your internet speed it is 
3 hours 30 mins. on my every test .

> so on the 24 Aug 2022 I just comment the install app program just to hopfully
> the script will be take a little bit shroter setup time

> make sure you really want to run this or you better of to view the file  
`scripts/call_script.sh` to just select the program you want to install and use 
before you run the `setup` script which will take too much time.

> you can just feel free to comment by put `#` in front the `sh` command line 
> if any of the program you will not use it

> the file `scripts/call_script.sh` content on 24 Aug 2022 :

```
#!/bin/bash



# this script will call another script 
# edit this file by add "#" infront of any propgramyou do not want to install

run_script_dir=~/archlinux_my_config/scripts

sh $run_script_dir/bluetooth.sh


# code editor 
sh $run_script_dir/code_editor.sh 


# download_tools.sh 
sh $run_script_dir/download_tools.sh 


# gimp is a photo editor like photoshop 
#sh $run_script_dir/gimp.sh 

sh $run_script_dir/gnome_app.sh 

sh $run_script_dir/iso_image_writer.sh 

sh $run_script_dir/kde_app.sh 

# the office suit program
sh $run_script_dir/libre_office.sh 

sh $run_script_dir/media_player_app.sh 

# screen capture program
sh $run_script_dir/screen_capture.sh

#sh $run_script_dir/shutter.sh 

#sh $run_script_dir/virt-manager.sh 

#sh $run_script_dir/virtualbox.sh 

sh $run_script_dir/xfce4_app.sh 

# the taskbar icon
sh $run_script_dir/applet.sh

# setup font for better Thai(and other like Chinese) Language support
sh $run_script_dir/font_install.sh

#sh $run_script_dir/sound_video_editor.sh

# this script will install the other program
sh $run_script_dir/other_app.sh

# photofilmstrip is has Error from python script 
# 1 Mar 2022
# sh $run_script_dir/photofilmstrip.sh

# to make photo slideshow as video
sh $run_script_dir/4kslideshowmaker.sh

# the web browser to install all web browser I use is take too much time
# remove # sign from the below line if you want to install
#sh $run_script_dir/web_browser.sh


# install puddletag on 09 Jan 2022
#sh $run_script_dir/puddletag.sh

# nvidia driver for nvidia graphic card
#sh $run_script_dir/nvidia-driver.sh





```






# Install Arch Linux Farook's way

> install arch linux is not easy but it is not either difficult so please 
> check this video! it's maybe can help you some.



## are you ready?

> want to watch the video "how to install arch linux farook's way" just click the below image! 




[![watch how to install arch linux on laptop](https://archive.org/download/arch_linux_myconfig_24-aug-2022_edit/arch_linux_myconfig_24-aug-2022_edit.png)](http://www.youtube.com/watch?v=yD3ub-qQGZY "")



## The icons theme I use now

> the icon theme call "revengeShip" 
> to change the new theme press `Mod+d` then type `loo` select 
`Customize Look and Feel`



[look_done]:https://i.ibb.co/xmvpvL1/look-done.png
[select_menu]:https://i.ibb.co/5B9mkV8/Select-menu-look.png

### ========= open Look and Feel to change theme,icon

![change theme icon][select_menu]



### ======== select menu tab

![select menu tab done][look_done]







[regen_blue]:https://i.ibb.co/sRnBBTS/2021-04-28-icons.png

![my icon theme][regen_blue]


---

[cursor_theme]:https://i.ibb.co/J581Fxb/Cursor-themes.png

[icon_theme]:https://i.ibb.co/zGRGnJm/Cursor-themes-1.png


## Cursor Theme


![cursor theme][cursor_theme]




## Icon Theme

![icon theme][icon_theme]






# ===== HP Printer Driver 24 Aug 2022 ========= 


> I have been using linux since Ubuntu 7.04 but I have never use printer 
> even one time so today (24 Aug 2022) is the first time ever for me to tried 
> out the print feature ha ha...
> I just install `cups` and `hplip` by run the command 

> `sudo pacman -S cups` 

> `yay -S hplip` 


> now i can print the document from my hp 3830 printer



[hp_printer]:https://archive.org/download/arch_linux_myconfig_24-aug-2022_edit/hp-3830_first-use.png


![hp printer][hp_printer]








## ============ Remove Program Report

> Atom will be no longer support on Dec 2022 so I have remove Atom from the 
> installation.




# Report 



### ============ date 1 Sep 2022 vim plug
> `server-tailwincss` for an easier tailwind


![tailwind plugin][tailwind_plug]


---

### ============ date 27 Aug 2022 

> added AstroNvim today after try to use it for a few moment 
> the AstroNvim is so cool! this is the easiest with 0 config for neovim 
> as to make it look like vscode this is very cool now. 

> visit here `https://github.com/AstroNvim/AstroNvim`

--- 


### ============ date 24 Aug 2022 

> fix vivaldi cannot play video is simple as 

> `sudo /opt/vivaldi/update-ffmpeg`

> copy the command from "https://forum.vivaldi.net/topic/42273/solved-html5-codecs-again/3"






### ============ date 7 Jul 2022  

> add handbrake for the video converter program.


--- 

### ============ date 5 july 2022 

> I just find out that my "URXVT" cannot copy and paste from clipboard 
> this is the very easy fix from `https://www.tomica.net/blog/2019/01/fixing-urxvt-copy-paste/` 
> just edit the "~/.Xresources" file by add the following line.

```
! Restore Ctrl+Shift+(c|v)
URxvt.keysym.Shift-Control-V: eval:paste_clipboard
URxvt.keysym.Shift-Control-C: eval:selection_to_clipboard
URxvt.iso14755: false
URxvt.iso14755_52: false


```

> then run `xrdb -merge .Xresources` 
> then re-open the URxvt again try to copy and past it should work now.


---



### ============ date 13 Apr 2022 
> install `birdtray` 


### birdtray icon

[birdtray]:https://i.ibb.co/19s1MTN/13-apr-2022-install-birdtray.png

![birdtray icon][birdtray]




--- 


### =========== date 8 Aug 2022 =============================================

> now my vim config could show status line with powerline 

> this is the first time I can set this SO EXCITE!!!


[vim_powerline]:https://i.ibb.co/HGYNqG5/vim-powerline.png


![vim powerline][vim_powerline]



### config file like above 

> go to `VIM2022` folder in `CONFIG_FILES`

> copy the `.vimrc` and the folder `.vim` then paste it into your home folder

> or use this command is simply as just : 

> `cd ~/archlinux_my_config/CONFIG_FILES/VIM2022 && sh setup.sh`

> now open your vim then type `:PlugInstall` or `:PlugUpdate` (well I don't 

> know which one is work for you) 

> I only have test this on my "VM" it is work very well so I don't think this 

> will be a huge difficult for you.


### ======= Video How to.

> please click the image below to see `how to` the video is on bitchute.com

> or you can copy and paste the below url to open in yor web browser

> `https://www.bitchute.com/video/E6tywLPBxkqp/`








[![my vimrc on aug 2022](https://i.ibb.co/HGYNqG5/vim-powerline.png)](https://www.bitchute.com/video/E6tywLPBxkqp/ "")








---


## ========= date 5 aug 2022 ============

> ***Copy chris's neovim config***


> vim is my code editor for years now using vim you will learn new thing every day 


> the nvim config copy from `git clone https://github.com/LunarVim/nvim-basic-ide.git` on the 6 Aug 2022


> ***Extra keys i just added to this config out from chris's video ***

> 

```
" multi cursor "
select text then press Ctrl>n 

" emmet "
type html code such as 
div then hold Ctrl<button> follow by press ,, you will get 

<div></div>

 or `ul>li*3>a` then hold Ctrl<button> follow by press ,, you will get 

 <ul>
   <li><a href=""></a></li>
   <li><a href=""></a></li>
   <li><a href=""></a></li>
 </ul>


```


> on 5 aug 2022 this will make neovim look cool and easy to use.



---

### ============ date 20 Jan 2022 
> neovim cannot be copy to system clipboard to fix this I just install "xsel" 
> `sudo pacman -S xsel` 
> this package has already install within this run script from now 
> the install script is list in `~/archlinux_my_config/scripts/other_app.sh` 
> last update 20 Jan 2022.

--- 

### ============ date 19 Jan 2022 
> today (19 Jan 2022 at 07:43 a.m.) I almost have to re-install arch-linux 
> as I have done it as my huge mistaken before! 
> The problem that I have face today was I cannot boot into my arch-os just 
> after I run `pamac update` to upgrade the package on my system but after the 
> upgrade done and I have re-boot all I got is just the bios boot which is make 
> me shock for a long while before I can think of why? without search on google 
> I just try to find my install archlinux usb then plug it in as the following 
> step as my blue screen bios boot has shown. 
> well this is `grub-recover` step okay? so do not get me wrong!

- plug the arch-linux install usb then press the power button to boot from usb
- I type `iwctl` as I do not have any wire connection to my laptop so I need 
the internet I type `device list` to see what is the device then I found wlan0 
now I know what is the interface for my network I then type 
`station wlan0 get-networks` just to get the wifi network I share the wifi from 
my phone my network name is "netDtac" so to connect to it network I type 
`station wlan0 connect netDtac` hit Enter then I put my wifi password in hit 
Enter now it connected then I type `exit` to quit out of iwctl.
- now make sure I have the internet access by send ping to google 
`ping google.com` I've got a reply the next thing to do is check the media by 
type `lsblk` so I've got my hard-dive name "nvme0" that has the partition as 
`nvme0n1p1`,`nvme0n1p2`,`nvme0n1p3` so my command to mount is (line by line)

> `mount /dev/nvme0n1p2 /mnt` 

> `mount /dev/nvme0n1p1 /boot` 


if I type 'lsblk' command again this shoud mount the media for me next command 
is `arch-chroot /mnt /bin/bash` now I am ready to install grub.
- I type 
> `grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub`  

- if the above has no error the next command is below but if there any error 
cannot install grub make sure you have correct when you type the command.  
> `grub-mkconfig -o /boot/grub/grub.cfg`

- that's it for grub re-cover now I can type `exit` then `umount -R /mnt` then 
`reboot` and my arch-linux os should be boot up again.

> so try it because it's work for me it's maybe will work for you as well.









### ============= date 25 Nov 2021 

> set ueberzug as the image preview for ranger






[ranger_ueberzug]:https://i.ibb.co/8Mnfb6m/ranger.png

!["use ueberzug as ranger preview image"][ranger_ueberzug]


### ============= touchpad on laptop
> I have spend all day on 15 Jan 2022 try to find "how to enable tab click" on 
> touchpad there will be long to write here I will make an article one day soon 
> but for now the use is 

- left click by tab 1 finger will act like do left click
- right click by tab 2 fingers will show the right click menu


### ============= setup bluetooth 
> just follow this tutorial here.
> `https://www.jeremymorgan.com/tutorials/linux/how-to-bluetooth-arch-linux/` 





### ============ problem solved

1. date 10 Nov 2021 problem solved.
2. date 12 Jan 2022 fixed lost click on touch pad.



### ============ my problem 

1. I cannot make the color status [date on 18 Nov 2021]





### ============ my problem 10 Nov 2021 

1. bluetooth not auto start.
2. vim not show color `Gruvbox`
3. cannot show emoji in the terminal it's must be some font missing 
4. alacritty font is the hell too small 



### ============ my font on 10 Nov 2021 
> all of the font that I have install in my arch linux now.

```
adobe-source-code-pro-fonts 2.038ro+1.058it+1.018var-1
cantarell-fonts 1:0.303-1
fontconfig 2:2.13.94-1
gnu-free-fonts 20120503-8
gsfonts 20200910-2
libfontenc 1.1.4-3
libxfont2 2.0.5-1
noto-fonts-emoji 20211101-1
terminus-font 4.49.1-2
ttf-font-awesome 5.15.4-1
ttf-ms-fonts 2.0-12
ttf-ubuntu-font-family 0.83-7
urxvt-resize-font-git 27.b593580-1
xorg-font-util 1.3.2-2
xorg-fonts-100dpi 1.0.3-7
xorg-fonts-75dpi 1.0.3-7
xorg-fonts-alias-100dpi 1.0.4-1
xorg-fonts-alias-75dpi 1.0.4-1
xorg-fonts-encodings 1.0.5-2
xorg-mkfontscale 1.2.1-2


```





