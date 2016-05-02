if [[ ! -d ~/.zplug ]]; then
    curl -sL git.io/zplug | zsh
    source $HOME/.zplug/zplug
fi

DISABLE_AUTO_UPDATE=true
source ~/.zplug/zplug

zplug "b4b4r07/zplug"
zplug "themes/gentoo", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/autojump", from:oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "plugins/git", from:oh-my-zsh, nice:10
zplug "voronkovich/gitignore.plugin.zsh", nice:10
zplug "Shougo/neobundle.vim", ignore:"*"
zplug "junegunn/fzf", use:"shell/*.zsh", hook-build:"./install --no-key-bindings --no-completion --no-update-rc --bin"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

path=(
    ~/.bin 
    ~/.local/bin
    ~/.zplug/repos/junegunn/fzf/bin 
    ~/.R/library/rt/bin
    $path
)

zstyle ':completion:*' special-dirs true
zstyle ':completion:*' menu select=2 eval "$(dircolors -b)"

setopt noflowcontrol
setopt prompt_subst
setopt append_history
setopt extended_history
setopt share_history
setopt histignorealldups
setopt autopushd

setopt noshwordsplit
setopt extended_glob
setopt completeinword
setopt longlistjobs
setopt notify
setopt hash_list_all
setopt interactivecomments
setopt pathdirs
setopt autoparamslash

bindkey -v
bindkey '^ ' autosuggest-accept
# bindkey -M vicmd 'yy' vi-yank-whole-line
# bindkey -M vicmd 'Y' vi-yank-eol
# bindkey -M vicmd 'u' undo
# bindkey -M vicmd 'U' redo
# bindkey -M viins '^w' backward-kill-word
# bindkey -M viins '^h' backward-delete-char

alias '..'='cd ..'
alias '...'='cd ../..'
alias '....'='cd ../../..'
alias '.....'='cd ../../../..'
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lha'
alias tmux='tmux -2'
alias du='du -h'
alias df='df -h'
alias mkdir='mkdir -p'
alias gst='git status -sb'
alias gs='git status -sb'
alias gstatus='nvim -c "Gstatus" -c "only" ..emptyfile'
alias agg='ag -f -g'
alias ag='ag -f'
alias lmk='latexmk -pdf'
alias vim='nvim'
alias depclean='sudo pacman -Rns $(pacman -Qtdq)'

alias -s pdf=xdg-open
alias -s ps=xdg-open
alias -s txt=nvim
alias -s tex=nvim
alias -s bib=nvim
alias -s R=nvim
alias -s r=nvim
alias -s Rnw=nvim
alias -s c=nvim
alias -s cpp=nvim
alias -s h=nvim

function greset {
    git fetch origin
    git reset --hard origin/master
}

function swap() {
  tmpfile=$(mktemp $(dirname "$1")/XXXXXX)
  mv "$1" "$tmpfile" && mv "$2" "$1" &&  mv "$tmpfile" "$2"
}

function utf() {
    for i; do
        encoding=$(file -i "$i" | grep -Po 'charset=\K.+?$')
        if [[ $encoding != "unknown" && $encoding != "binary" && $encoding != "utf-8" && encoding != "us-ascii" ]]; then
            echo "$i: $encoding -> utf8"
            recode iso8859-15..utf8 "$i"
        else
            echo "$i: $encoding"
        fi
    done
}

z() {
    cd $(autojump -s | head -n -7 | awk '{print $2}' | tac | fzf +s)
}

[[ -f ~/.zshlocal ]] && source ~/.zshlocal
