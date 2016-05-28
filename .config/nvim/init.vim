" ======================================================================================================================
" Plugin manager
" ======================================================================================================================
set runtimepath^=~/.config/nvim/bundle/repos/github.com/Shougo/dein.vim
let g:dein#types#git#clone_depth=1
call dein#begin(expand('~/.config/nvim/bundle'))
call dein#add('Shougo/dein.vim')

" Essentials
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-abolish') " Case insensitive replace
call dein#add('tpope/vim-eunuch') " Commands like :Remove
call dein#add('tpope/vim-sensible') " Better defaults
call dein#add('tpope/vim-endwise') " Some completions for viml/zsh/...
call dein#add('visualrepeat')
call dein#add('dietsche/vim-lastplace') " restore cursor position at start

" Appearance
call dein#add('chriskempson/vim-tomorrow-theme')
call dein#add('frankier/neovim-colors-solarized-truecolor-only')
call dein#add('vim-airline/vim-airline', {'hook_source' : 'source ~/.config/nvim/plugins/airline.vim'})
call dein#add('vim-airline/vim-airline-themes')

" Edit helpers
call dein#add('Shougo/deoplete.nvim', {'hook_source' : 'source ~/.config/nvim/plugins/deoplete.vim'}) " Completion
call dein#add('ujihisa/neco-look')
call dein#add('christoomey/vim-titlecase') " switch titlecase with gt+movement
call dein#add('tpope/vim-commentary') " Comment with gc
call dein#add('editorconfig/editorconfig-vim') " Support for editorconfig
call dein#add('tpope/vim-surround') " Delete, add and change surroundings
call dein#add('wellle/targets.vim') " More text objects
call dein#add('michaeljsmith/vim-indent-object') " Indentation objects for targets
call dein#add('junegunn/vim-easy-align', {'on_cmd' : '<Plug>(EasyAlign)', 'hook_source' : 'source ~/.config/nvim/plugins/vim-easy-align.vim'}) " Align on operators
call dein#add('AndrewRadev/switch.vim', {'hook_source' : 'source ~/.config/nvim/plugins/switch.vim'}) " Switch values like true/false with gs
call dein#add('machakann/vim-swap') " swap arguments with g< and g>
call dein#add('tommcdo/vim-exchange') " exchange objects using cx[motion]
call dein#add('christoomey/vim-sort-motion') " sort lines with gs
call dein#add('ReplaceWithRegister') " replace motion with register using gr<motion>
call dein#add('matze/vim-move', {'hook_source' : 'source ~/.config/nvim/plugins/vim-move.vim'}) " Move lines with <c-h> etc
call dein#add('itspriddle/vim-stripper', {'on_cmd' : 'Stripper'}) " Remove trailing whitespace
call dein#add('triglav/vim-visual-increment') " Increment numbers in visual mode
call dein#add('Shougo/neosnippet.vim', {'hook_source' : 'source ~/.config/nvim/plugins/neosnippet.vim'}) " Snippet engine
call dein#add('Shougo/neosnippet-snippets') " Snippets
call dein#add('mhinz/vim-sayonara', { 'on_cmd' : 'Sayonara' })

" Git/version control support
call dein#add('tpope/vim-fugitive')
call dein#add('mhinz/vim-signify') " Highlight changed lines
call dein#add('gregsexton/gitv', {'on_cmd' : 'Gitv'}) " git browser

" File system navigation
call dein#add('justinmk/vim-dirvish') " Quick and easy file browser
call dein#add('Shougo/unite.vim', {'hook_source' : 'source ~/.config/nvim/plugins/unite.vim'})
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neoyank.vim')

" Latex
call dein#add('LaTeX-Box-Team/LaTeX-Box', {'on_ft' : ['tex', 'rnoweb', 'rmarkdown'], 'hook_source' : 'source ~/.config/nvim/plugins/latex-box.vim'})

" R
call dein#add('jalvesaq/Nvim-R', {'on_ft' : ['r', 'rmd', 'rdoc', 'rnoweb'], 'on_path' : ['DESCRIPTION', 'NAMESPACE'], 'hook_source' : 'source ~/.config/nvim/plugins/nvim-r.vim'})
call dein#add('mllg/vim-devtools-plugin', {'on_ft' : ['r', 'rmd', 'rdoc', 'rnoweb'], 'on_path' : ['DESCRIPTION', 'NAMESPACE']})

" Syntax highlighting
call dein#add('keith/tmux.vim')
call dein#add('honza/dockerfile.vim')
call dein#add('dag/vim-fish')


call dein#end()
if dein#check_install()
    call dein#install()
endif
call dein#call_hook('source')
filetype plugin indent on
syntax on

" ======================================================================================================================
" Settings
" ======================================================================================================================
set cursorline
set number
set relativenumber
set showmode
set textwidth=999
set hidden
set autowriteall
set lazyredraw
set encoding=utf-8
set fileformats+=mac
set nrformats-=octal
set printoptions=paper:A4,number:y
set title
set undofile
set showmatch
set nojoinspaces
set virtualedit=block
set nostartofline
set scrolloff=5
set shortmess=aIT
set mouse=a
set clipboard=unnamedplus
set listchars=nbsp:¬,eol:¶,tab:>-,extends:»,precedes:«,trail:•
let g:terminal_scrollback_buffer=100000
set conceallevel=2 concealcursor=i

" Timeout
set timeout
set timeoutlen=750
set ttimeout
set ttimeoutlen=0

" Completion
set completeopt=longest,menuone
set wildmenu
set wildignore+=.git,.svn
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.o,*.lo,*.pdf

" Indent
set expandtab
set tabstop=4
set shiftwidth=0
set softtabstop=-1
set shiftround
set autoindent
set smartindent
set wrap
set breakindent
inoremap # X<c-h>#

" Search
set incsearch
set hlsearch
set smartcase
set ignorecase
set gdefault
set wrapscan
set magic

" Splits
set splitbelow
set splitright
set previewheight=25

" Spelling
set spelllang=en,de
set spellsuggest=fast,20


" ======================================================================================================================
" Autocommands
" ======================================================================================================================
function! MoveHelpRight()
    if !exists('w:help_is_moved') || w:help_is_moved != 'right'
        wincmd L
        let w:help_is_moved = 'right'
    endif
endfunction

augroup help_pages
    autocmd!
    autocmd FileType help nested call MoveHelpRight()
augroup END

augroup cursor_line
    autocmd!
    autocmd WinLeave * set nocursorline
    autocmd WinEnter * set cursorline
augroup END

augroup spellcheck_on
    autocmd!
    autocmd FileType gitcommit,tex,rmd,markdown,rnoweb setlocal spell
augroup END

augroup ftdetect_fixes
    autocmd!
    autocmd BufNewFile,BufReadPost *.Rmd set filetype=rmd
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
    autocmd FileType markdown,rmd syntax match Comment /\%^---\_.\{-}---$/
augroup END

augroup comment_string
    autocmd!
    autocmd FileType r setlocal commentstring=#\ %s
augroup END

" ======================================================================================================================
" Mappings
" ======================================================================================================================
let mapleader = ','
let maplocalleader = 'ß'

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

nmap K <nop>
map <c-h> :bp<cr>
map <c-l> :bn<cr>
inoremap <c-h> <left>
inoremap <c-l> <right>
vnoremap < <gv
vnoremap > >gv

nnoremap Y y$
nnoremap Q @q
nnoremap <backspace> :Sayonara!<cr>
nnoremap <Del> :Sayonara<cr>

" Keep search matches in the middle of the screen.
nnoremap n nzz
nnoremap N Nzz

" After block yank and paste, move cursor to the end of operated text
" Also, don't copy over-pasted text in visual mode
vnoremap y y`]
vnoremap p "_dP`]
nnoremap p p`]

nmap <silent> <leader>c :hardcopy >~/.cache/lastprint.ps<cr>
            \ :execute '!' 'xgd-open ~/.cache/lastprint.ps &'<cr>
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>
noremap <cr> i<Enter><esc>

" Windows resizing using arrow keys
nnoremap <silent> <Left> :vertical resize -1<CR>
nnoremap <silent> <Right> :vertical resize +1<CR>
nnoremap <silent> <Up> :resize +1<CR>
nnoremap <silent> <Down> :resize -1<CR>
" command W w !sudo tee % > /dev/null

" ======================================================================================================================
" Colorscheme
" ======================================================================================================================
set t_Co=256
set background=dark
if $NVIM_TUI_ENABLE_TRUE_COLOR
    colorscheme solarized
else
    colorscheme Tomorrow-Night
    hi clear SpellBad
    hi SpellBad cterm=undercurl
endif
set colorcolumn=
