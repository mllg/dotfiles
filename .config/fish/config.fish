abbr -a vim nvim
abbr -a gc git commit
abbr -a gd git diff
abbr -a ga git add
abbr -a gs git status
abbr -a gst git status

alias ll="ls -lhF --color=auto --group-directories-first --time-style=+%Y-%m-%d\ %H:%M"
alias la="ls -lhaF --color=auto --group-directories-first --time-style=+%Y-%m-%d\ %H:%M"
alias du="du -h"
alias df="df -h"
alias mkdir="mkdir -p"
alias gstatus='nvim -c "Gstatus" -c "only" ..emptyfile'
alias agg="ag -f -g"
alias ag="ag -f"
alias lmk="latexmk -pdf"
alias depclean="sudo pacman -Rns (pacman -Qtdq)"


function my_vi_key_bindings
    fish_vi_key_bindings
    bind -M insert \cf accept-autosuggestion
    bind \cf accept-autosuggestion
end
set -g fish_key_bindings my_vi_key_bindings
