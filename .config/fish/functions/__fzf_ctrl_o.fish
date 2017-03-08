function __fzf_ctrl_o
    set -l FZF_CTRL_O_COMMAND "git ls-files (git rev-parse --show-toplevel)"
    fish -c "$FZF_CTRL_O_COMMAND" | __fzfcmd -m | read -l selects
    and commandline -i "\"$selects\""
    commandline -f repaint
end
