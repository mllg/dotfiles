abbr --add vi 'nvim'
abbr --add vim 'nvim'
abbr --add gc 'git commit'
abbr --add gd 'git diff'
abbr --add ga 'git add'
abbr --add gp 'git push'
abbr --add gco 'git checkout'
abbr --add gcl 'git clone'
abbr --add gl 'git pull'
abbr --add gs 'git status'
abbr --add gst 'git status'
abbr --add amend 'git commit --amend --no-edit'
abbr --add rtf 'rtest --filter'
abbr --add rgg 'rg --files -uu --glob'
abbr --add rgf 'rg -F'
abbr --add lmk 'latexmk -pdf'
abbr --add du 'du -h'
abbr --add df 'df -h'
abbr --add pjo 'pj open'
abbr --add fd 'fd -I --hidden'
abbr --add 2x2 'pdfnup --nup 2x2 --suffix "2x2"'

alias ll="ls -lhF --time-style=+%Y-%m-%d\ %H:%M"
alias la="ls -lhFa --time-style=+%Y-%m-%d\ %H:%M"
alias mkdir="mkdir -p"
alias misticks="rg '^[^`]*`([^`]*`[^`]*`)*[^`]*\$'"

# fish_default_key_bindings
function fish_vi_cursor; end
fish_vi_key_bindings
function fish_user_key_bindings
    for mode in insert default visual
        bind -M $mode \cf forward-char
end
end

set -gx EDITOR nvim
set -gx SUDO_EDITOR nvim
set -gx MANPAGER "nvim -c 'set ft=man' -"
# set -gx OPENBLAS_NUM_THREADS 1
set -gx COLORTERM 1
set -gx GTK_USE_PORTAL 1
set -gx FZF_TMUX 1
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
set -gx FZF_FIND_FILE_COMMAND 'fd --type f --hidden --follow --exclude .git . $dir'
set -gx FZF_OPEN_COMMAND 'fd --type f --hidden --follow --exclude .git . $dir'

#set -gx FZF_DEFAULT_OPTS '--bind alt-a:select-all'
set -gx LANGUAGE en


for p in /usr/local/opt/coreutils/libexec/gnubin $HOME/.R/library/rt/bin $HOME/.local/bin
    if test -d "$p"
        set -g fish_user_paths $p $fish_user_paths
    end
end


if status --is-interactive; and type -q 'keychain'
    keychain --eval --quiet -Q id_rsa | source
end

if test -r ~/.config/fish/local.fish
  source ~/.config/fish/local.fish
end


fundle plugin 'danhper/fish-fastdir'
fundle plugin 'jethrokuan/fzf'
fundle plugin 'jethrokuan/z'
fundle plugin 'edc/bass'

if [ $TERM != 'linux' ];
    fundle plugin 'oh-my-fish/theme-bobthefish'
    set -g theme_display_vi yes
    set -g theme_color_scheme gruvbox
    set -g theme_nerd_fonts yes
    set -g theme_title_display_process yes
    set -g theme_display_user yes
    set fish_color_command brgreen
    set fish_color_param brbrown
end

fundle init
