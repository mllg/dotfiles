function update
    function info
        set_color red
        echo "--- $argv"
        set_color normal
    end

    if not test -f $HOME/.config/fish/functions/fundle.fish
        info "Installing fisherman"
        wget https://git.io/fundle -O $HOME/.config/fish/functions/fundle.fish
        fundle install
    else
        info "Updating fundle plugins"
        fundle self-update
        fundle update
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
