[ -z "$PS1" ] && return

export CLICOLOR=1
export LANG="en_US.UTF-8"
export HISTCONTROL=ignoreboth
export HISTSIZE=10000
export EDITOR="vim"
shopt -s cmdhist

if [ -d ~/.R/library/rt/bin ]; then
    PATH=~/.R/library/rt/bin:$PATH
fi


alias ls="ls --color=auto"
alias ll="ls -lh"
alias la="ls -alh"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
