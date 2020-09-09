function! TrimEndLines()
    let save_cursor = getpos(".")
    silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction

augroup trailing_lines
    autocmd!
    autocmd BufWritePre *.R,*.Rmd,*.Rnw,.tex call TrimEndLines()
augroup END
