map <c-h> :bp<cr>
map <c-l> :bn<cr>
nnoremap Y y$
nnoremap Q @q
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Keep search matches in the middle of the screen.
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz

nmap <F9> :Gstatus<cr>
