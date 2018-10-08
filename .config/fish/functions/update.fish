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
        fisher
    end

    if test -d $HOME/.fzf
        info "Updating fzf"
        git -C "$HOME/.fzf" pull
        eval $HOME/.fzf/install --bin
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

    if not test -d $HOME/.cache/dein/repos/github.com/Shougo/dein.vim
        info "Installing dein.vim"
        git clone --depth=1 'https://github.com/Shougo/dein.vim' "$HOME/.cache/dein/repos/github.com/Shougo/dein.vim"
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

    if test -d $HOME/.config/fish/fish_history
        info "Removing obsolete history file"
        rm $HOME/.config/fish/fish_history
    end
end
