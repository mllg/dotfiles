let g:unite_prompt='» '
if executable('ag')
    " let g:unite_source_rec_async_command =['ag', '--follow', '--nocolor', '--nogroup','--hidden', '-g', '']
    let g:unite_source_rec_async_command =['ag', '--vimgrep', '-g', '']
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts ='-i --vimgrep --hidden'
    let g:unite_source_grep_recursive_opt = ''
endif

function! UniteFromSearch()
    let l:search = getreg('/')
    let l:search = substitute(l:search, '\(^\\<\|\\>$\)','','g')
    execute ":Unite grep:.::" . l:search
endfunction
