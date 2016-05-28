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

nmap <c-t> :UniteWithProjectDir -start-insert file_rec/neovim<cr>
" nmap <c-t> :UniteWithProjectDir -start-insert -sync file_rec/neovim<cr>
nmap <c-g> :Unite grep:.<cr>
" command! -nargs=1 Ug :Unite grep:.::<args>
nmap <leader>d :Unite -start-insert file<cr>
nmap <leader>b :Unite buffer<cr>
nmap <leader>v :Unite history/yank<cr>
nmap <leader>m :Unite file_mru<cr>
nmap <leader>n :UniteNext<cr>
nmap <leader>p :UnitePrev<cr>
nmap <leader>u :UniteResume<cr>
nmap <leader>fw :UniteWithCursorWord -buffer-name=search grep<cr>
nmap <leader>ff :call UniteFromSearch()<cr>
