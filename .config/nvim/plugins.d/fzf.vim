Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

" Disable fuzzy matching for grep
" command! -bang -nargs=* Rg
"             \ call fzf#vim#grep(
"             \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
"             \   { 'options' : '--exact'},
"             \   <bang>0)


function! FloatingFZF()
    let width = float2nr(&columns * 0.9)
    let height = float2nr(&lines * 0.6)
    let opts = { 'relative': 'editor',
                \ 'row': (&lines - height) / 2,
                \ 'col': (&columns - width) / 2,
                \ 'width': width,
                \ 'height': height }

    let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    call setwinvar(win, '&winhighlight', 'NormalFloat:Normal')
endfunction

let $FZF_DEFAULT_OPTS .= ' --border --margin=0,2'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

nmap <silent> <c-o> :Files<cr>
nmap <silent> <c-g> :RG<cr>
nmap <silent> <leader>b :Buffers<cr>
nmap <silent> <leader>t :Tags<cr>
nnoremap <silent> <Leader>fw :RG <C-R><C-W><CR>
xnoremap <silent> <Leader>fw y:RG <C-R>"<CR>
