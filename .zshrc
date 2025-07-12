export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias h="cd ~"
alias i="sudo dnf install -y"
alias cns="cd /etc/nixos"
alias nrs="sudo nixos-rebuild switch"
alias yta="yt-dlp -x --audio-format mp3 --embed-metadata --embed-thumbnail --add-metadata "

eval "$(zoxide init --cmd cd zsh)"
