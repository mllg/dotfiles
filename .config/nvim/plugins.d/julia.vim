Plug 'jpalardy/vim-slime', {'branch': 'main', 'for': 'julia'}
Plug 'JuliaEditorSupport/julia-vim', {'for': 'julia'}
let g:slime_target = "neovim"
let g:slime_no_mappings = 1

fun! StartREPL()
  execute 'vsplit term://julia'
  let t:term_id = b:terminal_job_id
  wincmd p
  execute 'let b:slime_config = {"jobid": "'. t:term_id . '"}'
  xmap <leader>s <Plug>SlimeRegionSend
  nmap <leader>s <Plug>SlimeMotionSend
  nmap <space> <Plug>SlimeLineSend
endfun
