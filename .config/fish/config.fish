set fish_greeting

if status is-interactive
    abbr --add gc 'git commit'
    abbr --add gd 'git diff'
    abbr --add ga 'git add'
    abbr --add gp 'git push'
    abbr --add gco 'git checkout'
    abbr --add gcl 'git clone'
    abbr --add gl 'git pull'
    abbr --add gst 'git status'
    abbr --add amend 'git commit --amend --no-edit'
    abbr --add rtf 'rtest --filter'
    abbr --add rgg 'rg --files -uu --glob'
    abbr --add lmk 'latexmk -pdf'
    abbr --add du 'du -h'
    abbr --add df 'df -h'
    abbr --add fd 'fd -I --hidden'

    alias mkdir="mkdir -p"

    if [ (uname) = "Darwin" ]
        alias ll="ls -lhF"
        alias la="ls -lhFa"
    else
        alias ll="ls -lhF --time-style=+%Y-%m-%d\ %H:%M"
        alias la="ls -lhFa --time-style=+%Y-%m-%d\ %H:%M"
    end

    if  type -q 'keychain'
        keychain --eval --quiet -Q id_rsa | source
    end

end

set -gx LANGUAGE en
set -gx EDITOR nvim
set -gx SUDO_EDITOR nvim

for p in $HOME/.R/library/rtcl/bin $HOME/.local/bin /opt/homebrew/opt/openjdk/bin /opt/homebrew/bin
    if test -d "$p"
        set -g fish_user_paths $p $fish_user_paths
    end
end

if test -r ~/.config/fish/local.fish
  source ~/.config/fish/local.fish
end
