# archlinux_my_config
> my config for arch linux



> I just start to using Arch Linux on 10 Nov 2021 



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
3 hours 30 mins. on my every test.
> make sure you really want to run this or you better of to view the file  
`scripts/call_script.sh` to just select the program you want to install and use 
before you run the `setup` script which will take too much time.

> you can just feel free to comment by put `#` in front the `sh` command line 
> if any of the program you will not use it

> the file `scripts/call_script.sh` content on 19 Nov 2021 :

```

#!/bin/bash



# this script will call another script 


run_script_dir=~/archlinux_my_config/scripts

sh $run_script_dir/bluetooth.sh


# code editor 
sh $run_script_dir/code_editor.sh 


# download_tools.sh 
sh $run_script_dir/download_tools.sh 


sh $run_script_dir/gimp.sh 

sh $run_script_dir/gnome_app.sh 

sh $run_script_dir/iso_image_writer.sh 

sh $run_script_dir/kde_app.sh 

sh $run_script_dir/libre_office.sh 

sh $run_script_dir/media_player_app.sh 

sh $run_script_dir/screen_capture.sh

sh $run_script_dir/shutter.sh 

sh $run_script_dir/virt-manager.sh 

sh $run_script_dir/virtualbox.sh 

sh $run_script_dir/xfce4_app.sh 

sh $run_script_dir/applet.sh

sh $run_script_dir/font_install.sh

sh $run_script_dir/sound_video_editor.sh

sh $run_script_dir/other_app.sh

sh $run_script_dir/web_browser.sh



```






# Install Arch Linux Farook's way
> install arck linux is not easy but it is not either difficult so please 
> check this video! it's maybe can help you some.
> good luck


[![watch how to install arch linux on laptop](http://img.youtube.com/vi/yD3ub-qQGZY/0.jpg)](http://www.youtube.com/watch?v=yD3ub-qQGZY "")



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





### ============= date 25 Nov 2021 

> set ueberzug as the image preview for ranger






[ranger_ueberzug]:https://i.ibb.co/8Mnfb6m/ranger.png

!["use ueberzug as ranger preview image"][ranger_ueberzug]


### ============= touchpad on laptop
> I have spend all day on 15 Jan 2022 try to find "how to enable tab click" on 
> touchpad there will be long to write here I will make an article one day soon 
> but for now the use is 

- left click by tab 1 finger will act like do left click
- right click by tab 3 fingers will show the right click menu


### ============= setup bluetooth 
> just follow this tutorial here.
> `https://www.jeremymorgan.com/tutorials/linux/how-to-bluetooth-arch-linux/` 
> but until now I still cannot make my bluetooth device auto start I don't why?




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





