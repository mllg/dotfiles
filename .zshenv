export EDITOR=nvim
export R_EXPENSIVE_EXAMPLE_OK="TRUE"
export DIFF=vimdiff
export OPENBLAS_NUM_THREADS=1
export WEKA_HOME=~/.wekafiles
export COLORTERM=1
# export FZF_DEFAULT_OPTS="-x +2"
if [[ $UID > 0 || $EUID > 0 ]]; then
    export TEXMFHOME=~/.texmf
fi
