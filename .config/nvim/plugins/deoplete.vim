let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#disable_auto_complete = 0
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.r = ['\w+']
let g:deoplete#omni#input_patterns.rmd = ['\w+']
let g:deoplete#omni#input_patterns.rnoweb = ['\w+']
let g:deoplete#_keyword_patterns = {'_' : '[a-zA-Z_ÄÖÜäöüß]\k*'}

imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: "\<TAB>"
" nmap <leader>d :let g:deoplete#disable_auto_complete=!g:deoplete#disable_auto_complete<cr>
