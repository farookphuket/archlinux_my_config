# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use powerline
USE_POWERLINE="true"


# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi


# =============== color autosuggestions
# copy this code from https://github.com/zsh-users/zsh-autosuggestions
# on 28 May 2021

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=white,bg=black,bold,underline"

# ================ END 28 May 2021 ===========================================

#antigen bundle zsh-users/zsh-autosuggestions
# source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


plugins=(git zsh-syntax-highlighting zsh-autosuggestions)


autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu
bindkey '^X^X' history-beginning-search-menu






alias la='ls -A     --color=auto'
alias l='ls -CF     --color=auto'
alias cl='clear; fastfetch'
alias vi="nvim ."

# =========== For Debian ,Ubuntu
#alias nnet="cd /var/www/html; nautilus ."
#alias tnet="cd /var/www/html/"


# ======= manjaro
alias nnet="cd /srv/http; nautilus ."
alias tnet="cd /srv/http; tmux"



# ======== php artisan alias
alias ptinker="php artisan tinker"
alias pseed="php artisan db:seed"
alias pmifresh="php artisan migrate:fresh"
alias proute="php artisan route:list"
alias pwatch="npm run watch"


# add alias on 6 Jan 2026
alias cat="bat"
alias ls="eza -l --icons"
alias ll='eza -la   --icons'
alias syu="sudo pacman -Syu"
# just for using laravel edit on 21 Nov 21 with out this command you cannot run
# laravel new when you start new laravel project
# Add Composer bin-dir to PATH if it is installed.
    command -v composer >/dev/null 2>&1 && {
    COMPOSER_BIN_DIR=$(composer global config bin-dir --absolute 2> /dev/null)
    PATH="$PATH:$COMPOSER_BIN_DIR";
}
export PATH


fastfetch

# To customize prompt, run `p10k configure` or edit /usr/share/zsh/p10k.zsh.
# [[ ! -f /usr/share/zsh/p10k.zsh ]] || source /usr/share/zsh/p10k.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme


typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet


function cd (){
  new_directory="$*";
  if [ $# -eq 0 ]; then
    new_directory=${HOME};
  fi;
  builtin cd "${new_directory}" && /bin/ls -lhF --time-style=long-iso --color=auto --ignore=lost+found
}

