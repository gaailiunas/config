# Lines configured by zsh-newuser-install
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

export GPG_TTY=$TTY

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

export CLICOLOR=1
export PS1='%B%n@%m:%F{cyan}%~%f$ %b'
export EDITOR='vim'

bindkey '^[[A' up-line-or-search	# Ctrl + Up Arrow
bindkey '^[[B' down-line-or-search	# Ctrl + Down Arrow

bindkey "^[[1;5D" backward-word  # Ctrl + Left Arrow (move back by word)
bindkey "^[[1;5C" forward-word   # Ctrl + Right Arrow (move forward by word)
