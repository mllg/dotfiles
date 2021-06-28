function! SetTermOptions()
    set nobuflisted
    setlocal scrollback=10000
    setlocal signcolumn=no
    setlocal nonumber
    nnoremap <buffer> <c-h> <Nop>
    nnoremap <buffer> <c-l> <Nop>
    nnoremap <buffer> <c-c> i<c-c>
endfunction

augroup terminal_fixes
    autocmd TermOpen * call SetTermOptions()
augroup END

tnoremap <Esc> <C-\><C-n>
