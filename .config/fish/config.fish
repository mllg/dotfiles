set -U fish_user_abbreviations \
    'vi=nvim' \
    'vim=nvim' \
    'gc=git commit' \
    'gd=git diff' \
    'ga=git add' \
    'gp=git push' \
    'gco=git checkout' \
    'gcl=git clone' \
    'gl=git pull' \
    'gs=git status' \
    'gst=git status' \
    'amend=git commit --amend --no-edit' \
    'rtf=rtest --filter' \
    'rgg=rg --files -uu --glob' \
    'rgf=rg -F' \
    'lmk=latexmk -pdf' \
    'du=du -h' \
    'df=df -h' \
    'pjo=pj open' \
    'fd=fd -I'


alias ll="ls -lhF --time-style=+%Y-%m-%d\ %H:%M"
alias la="ls -lhFa --time-style=+%Y-%m-%d\ %H:%M"
alias mkdir="mkdir -p"
alias gstatus='nvim -c "Gstatus" -c "only" ..emptyfile'
alias glog='nvim -c "GV" -c "1bd"'
alias ...="cd ../../"
alias ....="cd ../../../"

# fish_default_key_bindings
function fish_vi_cursor; end
fish_vi_key_bindings
set -g theme_display_vi yes

set -gx EDITOR nvim
set -gx SUDO_EDITOR nvim
set -gx MANPAGER "nvim -c 'set ft=man' -"

# set -gx OPENBLAS_NUM_THREADS 1
set -gx WEKA_HOME $HOME/.wekafiles
set -gx COLORTERM 1
set -gx FZF_TMUX 1
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git --ignore-file .ignore'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_DEFAULT_OPTS '--bind alt-a:select-all'
set -gx LANGUAGE en

set -g theme_color_scheme gruvbox
set -g theme_display_user yes
set -g theme_title_display_process yes
set fish_color_command brgreen
set fish_color_param brbrown

for p in /usr/local/opt/coreutils/libexec/gnubin $HOME/.R/library/*/rt/bin $HOME/.fzf/bin $HOME/.local/bin
    if test -d "$p"
        set -g fish_user_paths $p $fish_user_paths
    end
end

if test -r ~/.config/fish/local.fish
  source ~/.config/fish/local.fish
end
