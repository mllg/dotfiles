Plug 'jpalardy/vim-slime', {'branch': 'main', 'for': 'julia'}
let g:slime_target = "neovim"
let g:slime_no_mappings = 1
xmap <leader>s <Plug>SlimeRegionSend
nmap <leader>s <Plug>SlimeMotionSend
nmap <leader>ss <Plug>SlimeLineSend

Plug 'JuliaEditorSupport/julia-vim', {'for': 'julia'}
