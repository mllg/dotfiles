let mapleader = ','
let maplocalleader = 'ß'

nnoremap Y y$
nnoremap Q @q

" do not yank replaced text in visual mode
vnoremap p "_dP

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Keep search matches in the middle of the screen.
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nmap <c-n> :cnext<cr>
nmap <c-p> :cprev<cr>
