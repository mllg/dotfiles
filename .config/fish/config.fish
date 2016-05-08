set fish_greeting ""

abbr -a vim nvim
abbr -a gc git commit
abbr -a gd git diff
abbr -a ga git add
abbr -a gs git status
abbr -a gst git status
abbr -a gp git push
abbr -a gco git checkout
abbr -a gl git pull

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
    bind -M insert \ct '__fzf_ctrl_t'
    bind -M insert \cr '__fzf_ctrl_r'
    bind -M insert \cx '__fzf_ctrl_x'
    bind -M \insert \ec '__fzf_alt_c'
    bind -M insert \cf accept-autosuggestion
    bind \cf accept-autosuggestion
    bind \cr accept-autosuggestion
end

set -g fish_key_bindings my_vi_key_bindings
