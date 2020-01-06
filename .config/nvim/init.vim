if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo  ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/switch.vim', { 'on': 'Switch' }
Plug 'dietsche/vim-lastplace'
Plug 'editorconfig/editorconfig-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'honza/vim-snippets'
Plug 'jalvesaq/Nvim-R', { 'for': ['r', 'rmd'] }
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-dirvish'
Plug 'justinmk/vim-gtfo'
Plug 'lifepillar/vim-solarized8'
Plug 'liuchengxu/vim-clap'
Plug 'matze/vim-move'
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'mhinz/vim-startify'
Plug 'mllg/vim-devtools-plugin', { 'for': ['r', 'rmd'] }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'wellle/targets.vim'
Plug 'lervag/vimtex'

call plug#end()

" Settings
set expandtab
set tabstop=4
set clipboard=unnamedplus
set undofile
set hidden
set cursorline
set number
set printoptions=paper:A4,number:y
set spelllang=en,de
set spellsuggest=fast,20
set smartcase
set ignorecase
set wrapscan

function! SetTermOptions()
    set nobuflisted
    setlocal scrollback=10000
    setlocal nonumber
    nnoremap <buffer> <c-h> <Nop>
    nnoremap <buffer> <c-l> <Nop>
endfunction
augroup terminal_fixes
    autocmd TermOpen * call SetTermOptions()
augroup END


" Commands
let mapleader = ','
let maplocalleader = 'ß'

nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>
tnoremap <Esc> <C-\><C-n>
nnoremap <backspace> :Sayonara!<cr>
nnoremap <Del> :Sayonara<cr>
" nmap K <nop>

" Colorscheme
set termguicolors
colorscheme gruvbox
let g:gruvbox_italic=1

" Airline
let g:airline_powerline_fonts = 1
let g:airline_extensions = ['branch', 'tabline', 'quickfix', 'whitespace', 'wordcount']
let g:airline#extensions#tabline#enabled = 1

" Clap
nmap <c-o> :Clap files<cr>
nmap <c-g> :Clap grep<cr>


" Mappings
map <c-h> :bp<cr>
map <c-l> :bn<cr>
nnoremap Y y$
nnoremap Q @q

" Coc
set shortmess+=c
set updatetime=300
set cmdheight=2
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
let g:coc_global_extensions = ['coc-snippets', 'coc-vimlsp', 'coc-r-lsp', 'coc-yaml', 'coc-git', 'coc-texlab']

nmap <silent> gd <Plug>(coc-definition)

" Easy Align
vmap <Enter> <Plug>(EasyAlign)

" Move
let g:move_map_keys = 0
nmap <C-j> <Plug>MoveLineDown
nmap <C-k> <Plug>MoveLineUp
vmap <C-j> <Plug>MoveBlockDown
vmap <C-k> <Plug>MoveBlockUp

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" R +  devtools
let g:r_indent_align_args = 0
let g:R_assign = 0
let g:rout_follow_colorscheme = 1
let g:R_nvimpager = 'horizontal'
let g:R_openpdf = 0
let g:R_openhtml = 0
let R_hl_term = 1
let R_synctex = 0
let R_latexcmd = ['pdflatex']
if !has("mac")
    let g:R_pdfviewer = 'okular'
endif
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine

let g:devtools_commands = 0
command! -complete=dir -nargs=? RLoadPackage :call devtools#simple_cmd('load_all', <f-args>)
command! -complete=dir -nargs=? RCheckPackage :call devtools#simple_cmd('check', <f-args>)
command! -complete=dir -nargs=? RDocumentPackage :call devtools#simple_cmd('document', <f-args>)
command! -complete=dir -nargs=? RClean :call devtools#simple_cmd('clean_dll', <f-args>)
command! -complete=dir -nargs=* RTestPackage :call devtools#test(<f-args>)
command! -complete=dir -nargs=? RMake :call devtools#make(<f-args>)
command! -complete=dir -nargs=? RBuildPackageTags :call devtools#build_tags(<f-args>)
command! -complete=file -nargs=? RUsage :call devtools#usage(<f-args>)

" Startify
nmap <F2> :Startify<cr>
let g:startify_bookmarks = [ {'n': '~/.config/nvim/init.vim'}, {'f': '~/.config/fish/config.fish'}, {'r': '~/.Rprofile'} ]
let g:startify_change_to_dir = 0

" GTFO
let g:gtfo#terminals = { 'unix' : 'konsole --workdir' }

" Switch
let g:switch_custom_definitions = [['TRUE', 'FALSE']]
let g:switch_mapping = ""
nmap <silent> + :Switch<cr>

function! FindRoot(markers)
    if &ft == 'fugitive' || &ft == 'help'
        return ''
    endif

    let l:path = fnamemodify(expand('%'), ':p')
    while 1
        let l:path = fnamemodify(l:path, ':h')

        " do not search in '~' or parents of '~'
        if l:path == expand('$HOME') || l:path == '/'
            break
        endif

        for marker in a:markers
            let l:fn = l:path . '/' . marker
            if filereadable(fn) || isdirectory(fn)
                return path
            endif
        endfor
    endwhile

    return ''
endfunction

function! AutoRoot()
    try
        let l:path = FindRoot(['.projectroot', '.editorconfig', '.git', '.svn', 'DESCRIPTION'])
        if strlen(l:path)
            echo '[AutoRoot] ' . l:path
            execute ':cd' fnameescape(l:path)
        endif
    catch
        " Silently ignore invalid buffers
    endtry
endfunction

augroup autoroot
    autocmd!
    autocmd BufEnter * call AutoRoot()
augroup END
