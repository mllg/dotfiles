set fish_greeting ""

set -U fish_user_abbreviations \
    'vim=nvim' \
    'gc=git commit' \
    'gd=git diff' \
    'ga=git add' \
    'gp=git push' \
    'gco=git clone' \
    'gl=git pull' \
    'gst=git status -sb'

alias ll="ls -lhF --time-style=+%Y-%m-%d\ %H:%M"
alias la="ls -lhFa --time-style=+%Y-%m-%d\ %H:%M"
alias du="du -h"
alias df="df -h"
alias mkdir="mkdir -p"
alias gstatus='nvim -c "Gstatus" -c "only" ..emptyfile'
alias agg="ag -f -g"
alias ag="ag -f"
alias lmk="latexmk -pdf"
alias depclean="sudo pacman -Rns (pacman -Qtdq)"
alias ...="cd ../../"
alias ....="cd ../../../"

function my_vi_key_bindings
    # Workaround for https://github.com/fish-shell/fish-shell/issues/2254
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

set -gx EDITOR nvim
set -gx SUDO_EDITOR nvim
set -gx PAGER "nvim -c PAGER -"
set -gx MANPAGER "/bin/sh -c 'col -b | nvim -c MANPAGER -'"
if test (uname) = "Darwin"
    set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
end
set -gx PATH ~/.R/library/rt/bin $PATH
set -gx OPENBLAS_NUM_THREADS 1
set -gx WEKA_HOME $HOME/.wekafiles
set -gx COLORTERM 1

function set_secrets
    set -xU OPENMLAPIKEY (pass show openml.api.key)
    set -xU GITHUB_TOKEN (pass show github.token)
end

function update
    function info
        set_color red
        echo "--- $argv"
        set_color normal
    end

    if not test -f $HOME/.config/fish/functions/fisher.fish
        info "Installing fisherman"
        curl -Lo $HOME/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman
        fisher
    else
        info "Updating fisherman plugins"
        fisher up
    end

    if not test -d $HOME/.tmux/plugins/tpm
        info "Installing TPM"
        git clone --depth=1 https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
        ~/.tmux/plugins/tpm/bin/install_plugins
    else
        info "Updating TPM plugins"
        ~/.tmux/plugins/tpm/bin/install_plugins
        ~/.tmux/plugins/tpm/bin/clean_plugins
        ~/.tmux/plugins/tpm/bin/update_plugins all
    end

    if not test -d $HOME/.config/nvim/bundle/neobundle.vim
        info "Installing TPM"
        git clone --depth=1 https://github.com/Shougo/neobundle.vim "$HOME/.config/nvim/bundle/neobundle.vim"
    end

    if not test -d $HOME/.R/library
        info "Setting up R library and installing rt"
        mkdir -p $HOME/.R/library
        Rscript -e 'install.packages("devtools", repos = "http://cloud.r-project.org/")'
        Rscript -e 'devtools::install_github("rdatsci/rt")'
    else
        info "Updating R packages"
        rupdate
    end
end

for file in ~/.config/fish/conf.d/*.fish
    source $file
end

if test -r ~/.config/fish/local.fish
  source ~/.config/fish/local.fish
end
