function __fzf_ctrl_o
    set -g FZF_CTRL_T_COMMAND "git ls-files --full-name (git rev-parse --show-toplevel)"
    __fzf_ctrl_t
end
