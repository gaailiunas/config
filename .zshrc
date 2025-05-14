# Created by newuser for 5.9
PROMPT='%F{cyan}%n@%m%f:%F{yellow}%~%f%# '

zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit

# Enable color support of ls and also add handy aliases (yanked from .bashrc)
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

HISTFILE=~/.zsh_history  # File where history is saved
HISTSIZE=10000           # Number of commands to save in memory
SAVEHIST=10000           # Number of commands to save in the history file
setopt append_history    # Append history to the file (instead of overwriting)
setopt inc_append_history  # Incrementally append history to the file
setopt share_history     # Share history across all sessions

bindkey '^[[A' up-line-or-search	# Ctrl + Up Arrow
bindkey '^[[B' down-line-or-search	# Ctrl + Down Arrow

bindkey "^[[1;5D" backward-word  # Ctrl + Left Arrow (move back by word)
bindkey "^[[1;5C" forward-word   # Ctrl + Right Arrow (move forward by word)
