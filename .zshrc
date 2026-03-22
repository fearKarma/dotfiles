# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob notify histignoredups
# Completion
autoload -Uz compinit
compinit
# Vi mode
# bindkey -v
# Exports
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export VISUAL=nvim
export EDITOR=nvim
export TERMINAL=kitty
# Active project (change with: setwork <project_name>)
export AL_WORK="Http-Server-Learning-Project"
# FZF
export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}'"
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Prompt
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
bindkey -e
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line
# Aliases

alias ls="eza --icons"
alias ll="eza --icons -la"
alias lt="eza --icons --tree --level=2"
alias cat="bat"
alias v="nvim"
alias zp="v ~/.zshrc"
alias zz="source ~/.zshrc && echo 'zsh reloaded.'"
alias eye3="v ~/.config/i3/config"
#alias work="cd ~/workspace/github.com/fearKarma"

# Jump to active project
work(){
    local base="$HOME/workspace/github.com/fearKarma"
    if [[ -d "$base/$AL_WORK" ]]; then
        cd "$base/$AL_WORK"
    else
        echo "Project '$AL_WORK' not found, going to base."
        cd "$base"
    fi
}

# MPV helper
mpv1() {
  if [[ -d "$1" ]]; then
    mpv --playlist="$1" & disown
  else
    mpv "$1" & disown
  fi
}
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
# Launch tmux
if [ -z "$TMUX" ]; then
  exec tmux new-session -s "$(date +%s)"
fi
alias clip='xclip -selection clipboard'
alias cd="z"
