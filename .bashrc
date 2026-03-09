#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export VISUAL=nvim
export EDITOR=nvim
export TERMINAL=kitty
set -o vi
#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /usr/share/powerline/bindings/bash/powerline.sh

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'
PS1='\[\e[38;5;40m\]\T\[\e[0m\] \[\e[38;5;213m\]\w\[\e[0m\] \[\e[38;5;50m\]${PS1_CMD1}\[\e[0m\] '

alias c="clear"
alias hme='cd ~/'
#alias work='cd ~/workspace/github.com/fearKarma'
alias work='cd ~/workspace/http-server-c/'


alias bz='source ~/.bashrc;echo "bash aliases sourced."'
alias v='nvim'
alias bp='v  ~/.bashrc'

alias eye3="v ~/.config/i3/config"
alias qb="qbittorrent"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
