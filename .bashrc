[ -z "$PS1" ] && return

export CLICOLOR=1
export LANG="en_US.UTF-8"
export HISTCONTROL=ignoreboth
export HISTSIZE=10000
export EDITOR="vim"
shopt -s cmdhist

alias ls="ls --color=auto"
alias ll="ls -lh"
alias la="ls -alh"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
