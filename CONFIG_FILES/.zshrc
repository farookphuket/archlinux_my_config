# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use powerline
USE_POWERLINE="true"

# Safe Source Manjaro ZSH Configuration (Only source if file exists to prevent clean install error)
if [[ -f /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
if [[ -f /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# =============== ZSH Plugins & UI Configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=white,bg=black,bold,underline"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu
bindkey '^X^X' history-beginning-search-menu

# =============== Personal Custom Aliases
alias la='ls -A     --color=auto'
alias l='ls -CF     --color=auto'
alias cl='clear; fastfetch'
alias vi="nvim ."
alias tree="eza --tree --icons"

# Web Development Aliases (Targeted for Arch system default)
alias nnet="cd /srv/http; nautilus ."
alias tnet="cd /srv/http; tmux"

# PHP Artisan & Laravel Developer Suite
alias ptinker="php artisan tinker"
alias pseed="php artisan db:seed"
alias pmifresh="php artisan migrate:fresh"
alias proute="php artisan route:list"
alias pwatch="npm run watch"

# Modern CLI Replacements 
alias cat="bat"
alias ls="eza -l --icons"
alias ll='eza -la   --icons'
alias syu="sudo pacman -Syu"

# ⌨️ Keyboard Reload Alias (If shortcut or layout acts weird)
alias kbr="sh ~/.config/dwm/custom_script/set_kb.sh"

# Global Composer path configuration for Laravel Installer
command -v composer >/dev/null 2>&1 && {
    COMPOSER_BIN_DIR=$(composer global config bin-dir --absolute 2> /dev/null)
    PATH="$PATH:$COMPOSER_BIN_DIR";
}
export PATH

# Run system status info display
fastfetch

# Load Powerlevel10k Theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Custom CD Command with automatic beautiful ls listing
function cd (){
  new_directory="$*";
  if [ $# -eq 0 ]; then
    new_directory=${HOME};
  fi;
  builtin cd "${new_directory}" && /bin/ls -lhF --time-style=long-iso --color=auto --ignore=lost+found
}

# Source local environment paths safely
[[ -f "$HOME/.local/bin/env" ]] && . "$HOME/.local/bin/env"
