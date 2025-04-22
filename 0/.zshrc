# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/laurynas/.zshrc'
# Enable menu-style completion highlighting
zstyle ':completion:*' menu select
autoload -Uz compinit
compinit
# End of lines added by compinstall

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

PROMPT='%F{green}%n@%m%f:%F{blue}%~%f$ '
EDITOR='vim'

bindkey '^[[A' up-line-or-search	# Ctrl + Up Arrow
bindkey '^[[B' down-line-or-search	# Ctrl + Down Arrow

bindkey "^[[1;5D" backward-word  # Ctrl + Left Arrow (move back by word)
bindkey "^[[1;5C" forward-word   # Ctrl + Right Arrow (move forward by word)
