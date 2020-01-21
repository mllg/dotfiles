map <c-h> :bp<cr>
map <c-l> :bn<cr>
nnoremap Y y$
nnoremap Q @q
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
