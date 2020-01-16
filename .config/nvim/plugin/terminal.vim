" set terminal options
function! SetTermOptions()
    set nobuflisted
    setlocal scrollback=10000
    setlocal signcolumn=no
    setlocal nonumber
    nnoremap <buffer> <c-h> <Nop>
    nnoremap <buffer> <c-l> <Nop>
endfunction

augroup terminal_fixes
    autocmd TermOpen * call SetTermOptions()
augroup END

tnoremap <Esc> <C-\><C-n>
