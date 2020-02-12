Plug 'voldikss/vim-translator'

let g:translator_target_lang = 'de'
let g:translator_default_engines = ['google']

nmap <silent> <Leader>d <Plug>TranslateW
vmap <silent> <Leader>d <Plug>TranslateWV
