#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
export VISUAL=nvim
export EDITOR=nvim
export TERMINAL=kitty
# Active project (change with: setwork <project_name>)
export AL_WORK="Http-Server-Learning-Project"
set -o vi
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'
PS1='\[\e[38;5;40m\]\T\[\e[0m\] \[\e[38;5;213m\]\w\[\e[0m\] \[\e[38;5;50m\]${PS1_CMD1}\[\e[0m\] '
alias c="clear"
alias hme='cd ~/'
alias work='cd ~/workspace/github.com/fearKarma'
# Jump to active project
al_work() {
    local base="$HOME/workspace/github.com/fearKarma"
    if [[ -d "$base/$AL_WORK" ]]; then
        cd "$base/$AL_WORK"
    else
        echo "Project '$AL_WORK' not found, going to base."
        cd "$base"
    fi
}
alias bz='source ~/.bashrc; echo "bash reloaded."'
alias v='nvim'
alias bp='v ~/.bashrc'
alias eye3="v ~/.config/i3/config"
alias qb="qbittorrent"
# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
