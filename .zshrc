export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias h="cd ~"

# for fedora users : 
# alias i="sudo dnf install -y"

# for Arch Linux users ( btw ) : 
# alias i="sudo pacman -S --noconfirm"

# for NixOs users : 
# alias cns="cd /etc/nixos"
# alias nrs="sudo nixos-rebuild switch"


# An amanzing and ultra handy command to install youtube playlists songs directly from terminal with ease
# it downloads playlist/SingleSong in mp3 ( audio only ) format with their metadata as well ( like thumbnail , artist etc )
alias yta="yt-dlp -x --audio-format mp3 --embed-metadata --embed-thumbnail --add-metadata "


# it sets up zoxide as your cd command which an amazing tool to use over normal cd command
eval "$(zoxide init --cmd cd zsh)"
