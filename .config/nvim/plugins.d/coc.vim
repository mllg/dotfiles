Plug 'neoclide/coc.nvim', { 'branch': 'release' }

set shortmess+=c
set updatetime=300
set cmdheight=2
set signcolumn=yes

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

let g:coc_snippet_next = '<tab>'
let g:coc_global_extensions = ['coc-snippets', 'coc-vimlsp', 'coc-r-lsp', 'coc-yaml', 'coc-git', 'coc-texlab', 'coc-dictionary', 'coc-lists', 'coc-julia']

nmap <silent> gd <Plug>(coc-definition)

nmap <silent> <c-o> :CocList files<cr>
nmap <silent> <c-g> :CocList grep<cr>
nmap <silent> <leader>b :CocList buffers<cr>
nmap <silent> <leader>t :CocList tags<cr>
nnoremap <silent> <leader>fw  :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>
nmap <leader>n :CocNext<cr>
nmap <leader>p :CocPrev<cr>
