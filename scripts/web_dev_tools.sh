
#!/bin/bash 


# to install the web development tools and environment

## ============================================================================
## =============== install postman ============================================
# 

mkdir -p ~/install_app
# change dir to home dir 
cd ~/install_app

# clone the script 
git clone https://aur.archlinux.org/postman-bin.git 

cd postman-bin 

makepkg -si 

## ============================================================================




