" set dictionary for completion
function! SetDictionary()
    let l:parts = split(&spelllang, ',')
    if index(l:parts, 'en') != -1 && filereadable('/usr/share/dict/american-english')
        setlocal dictionary+=/usr/share/dict/american-english
    endif
    if index(l:parts, 'de') != -1 && filereadable('/usr/share/dict/german')
        setlocal dictionary+=/usr/share/dict/german
    endif
endfunction

augroup set_dictionary
    autocmd BufReadPost * call SetDictionary()
augroup END
