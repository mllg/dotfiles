" ======================================================================================================================
" 1.0 Plugin manager (Plug) settings
" ======================================================================================================================
if has('vim_starting')
    set runtimepath+=~/.zplug/repos/Shougo/neobundle.vim/
endif

call neobundle#begin(expand('~/.config/nvim/bundle/'))
let g:neobundle#types#git#clone_depth = 1

" ======================================================================================================================
" 1.1 Plugin List
" ======================================================================================================================

" ---------------------------------------------------------------------------------------------------------------------
" Language Agnostic Plugins
" ---------------------------------------------------------------------------------------------------------------------
NeoBundle 'Shougo/vimproc.vim', {'build' : { 'mac' : 'make -f make_mac.mak', 'linux' : 'make' }}
NeoBundle 'tpope/vim-repeat'
NeoBundle 'visualrepeat'
NeoBundle 'mbbill/undotree'
NeoBundle 'benekastah/neomake'
NeoBundle 'nelstrom/vim-visual-star-search'
NeoBundle 'tpope/vim-abolish' " Case insensitive replace
NeoBundle 'tpope/vim-eunuch' " Commands like :Remove
NeoBundle 'tpope/vim-sensible' " Better defaults
NeoBundle 'tpope/vim-endwise' " Some completions for viml/zsh/...
NeoBundleLazy 'schickling/vim-bufonly', {'autoload' : { 'commands' : 'BufOnly' }}
NeoBundle 'christoomey/vim-titlecase' " switch titlecase with gt+movement
NeoBundle 'dietsche/vim-lastplace'
NeoBundle 'justinmk/vim-dirvish' " Quick and easy file browser

" ---------------------------------------------------------------------------------------------------------------------
" Color Schemes And Apperance
" ---------------------------------------------------------------------------------------------------------------------
NeoBundle 'frankier/neovim-colors-solarized-truecolor-only'
NeoBundle 'chriskempson/vim-tomorrow-theme'
" NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'sheerun/vim-wombat-scheme'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'

" ---------------------------------------------------------------------------------------------------------------------
" External Tool Support
" ---------------------------------------------------------------------------------------------------------------------
NeoBundle 'tpope/vim-fugitive' " Git support
NeoBundle 'mhinz/vim-signify' " Highlight changed lines
NeoBundleLazy 'gregsexton/gitv', {'autoload' : {'commands' : 'Gitv'}}

" ---------------------------------------------------------------------------------------------------------------------
" Text Editing Tools
" ---------------------------------------------------------------------------------------------------------------------
NeoBundle 'tpope/vim-commentary' " Comment with gc
NeoBundle 'editorconfig/editorconfig-vim' " Support for editorconfig
NeoBundle 'tpope/vim-surround' " Delete, add and change surroundings
NeoBundle 'wellle/targets.vim' " More text objects
NeoBundle 'michaeljsmith/vim-indent-object' " Indentation objects for targets
NeoBundleLazy 'junegunn/vim-easy-align', {'autoload' : {'mappings' : '<Plug>(EasyAlign)'}} " Align on operators
NeoBundleLazy 'itspriddle/vim-stripper', {'autoload' : {'commands' : 'Stripper'}} " Remove trailing whitespace
NeoBundle 'AndrewRadev/switch.vim' " Switch values like true/false with gs
NeoBundle 'triglav/vim-visual-increment' " Increment numbers in visual mode
NeoBundle 'machakann/vim-swap' " swap arguments with g< and g>
NeoBundle 'tommcdo/vim-exchange' " exchange objects using cx[motion]

" ---------------------------------------------------------------------------------------------------------------------
" Unite
" ---------------------------------------------------------------------------------------------------------------------
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neoyank.vim'

" ---------------------------------------------------------------------------------------------------------------------
" Latex
" ---------------------------------------------------------------------------------------------------------------------
" NeoBundle 'lervag/vimtex'
NeoBundleLazy 'LaTeX-Box-Team/LaTeX-Box', {'autoload' : {'filetypes' : ['tex', 'rnoweb', 'rmarkdown']}}

" ---------------------------------------------------------------------------------------------------------------------
" R
" ---------------------------------------------------------------------------------------------------------------------
NeoBundleLazy 'jalvesaq/Nvim-R', {'autoload' : {'filetypes' : ['r', 'rmd', 'rdoc', 'rnoweb'], 'filename_patterns': ['DESCRIPTION', 'NAMEPSAPCE']}}
NeoBundle 'git@github.com:mllg/vim-devtools-plugin.git'

" ---------------------------------------------------------------------------------------------------------------------
" Syntax Highlighting
" ---------------------------------------------------------------------------------------------------------------------
NeoBundle 'keith/tmux.vim'
NeoBundle 'honza/dockerfile.vim'
NeoBundle 'jez/vim-superman'

" ---------------------------------------------------------------------------------------------------------------------
" Auto Completion
" ---------------------------------------------------------------------------------------------------------------------
NeoBundle 'Shougo/deoplete.nvim'
NeoBundle 'ujihisa/neco-look'

" ---------------------------------------------------------------------------------------------------------------------
" Snippets
" ---------------------------------------------------------------------------------------------------------------------
NeoBundleLazy 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'

" ---------------------------------------------------------------------------------------------------------------------
" Misc
" ---------------------------------------------------------------------------------------------------------------------
NeoBundle 'matze/vim-move' " Move lines with <c-h> etc
NeoBundle 'easymotion/vim-easymotion' " Move quickly
NeoBundleLazy 'mhinz/vim-sayonara', {'autoload' : { 'commands' : 'Sayonara' }}

" ======================================================================================================================
" 1.2 End of plugin declaration
" ======================================================================================================================
call neobundle#end()
filetype plugin indent on
syntax on
NeoBundleCheck


" ======================================================================================================================
" 2.0 Basic settings
" ======================================================================================================================
set shell=zsh
set cursorline
set number
set showmode
set textwidth=999
" set autochdir
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

"--------------------------------------------------------------------------------------------------
" Timeout
"--------------------------------------------------------------------------------------------------
set timeout
set timeoutlen=750
set ttimeout
set ttimeoutlen=0

"--------------------------------------------------------------------------------------------------
" Completion
"--------------------------------------------------------------------------------------------------
set completeopt=longest,menuone
set wildmenu
set wildignore+=.git,.svn
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.o,*.lo,*.pdf

"--------------------------------------------------------------------------------------------------
" Indent
"--------------------------------------------------------------------------------------------------
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

"--------------------------------------------------------------------------------------------------
" Search
"--------------------------------------------------------------------------------------------------
set incsearch
set hlsearch
set smartcase
set ignorecase
set gdefault
set wrapscan
set magic
"
"--------------------------------------------------------------------------------------------------
" Splits
"--------------------------------------------------------------------------------------------------
set splitbelow
set splitright
set previewheight=25

"--------------------------------------------------------------------------------------------------
" Spelling
"--------------------------------------------------------------------------------------------------
set spelllang=en,de
set spellsuggest=fast,20

"--------------------------------------------------------------------------------------------------
" functions
"--------------------------------------------------------------------------------------------------
function! UniteFromSearch()
    let l:search = getreg('/')
    let l:search = substitute(l:search, '\(^\\<\|\\>$\)','','g')
    execute ":Unite grep:.::" . l:search
endfunction

function! MoveHelpRight()
    if !exists('w:help_is_moved') || w:help_is_moved != 'right'
        wincmd L
        let w:help_is_moved = 'right'
    endif
endfunction

function! EnsureExists(path)
    if !isdirectory(expand(a:path))
        call mkdir(expand(a:path), 'p')
    endif
endfunction

"--------------------------------------------------------------------------------------------------
" autocommands
"--------------------------------------------------------------------------------------------------
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

augroup help_vsplit

" ======================================================================================================================
" 3.0 Mappings
" ======================================================================================================================
let mapleader = ','
let maplocalleader = 'ß'

nnoremap <silent> j gj
nnoremap <silent> k gk

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

nnoremap <silent> <leader>gs :Gstatus<cr>
nnoremap <silent> <leader>gd :Gdiff<cr>
nnoremap <silent> <leader>gc :Gcommit<cr>
nnoremap <silent> <leader>gb :Gblame<cr>
nnoremap <silent> <leader>gl :Glog<cr>
nnoremap <silent> <leader>gp :Git push<cr>
nnoremap <silent> <leader>gw :Gwrite<cr>
nnoremap <silent> <leader>gr :Gremove<cr>

nmap <c-t> :UniteWithProjectDir -start-insert file_rec/async<cr>
" nmap <c-t> :UniteWithProjectDir -start-insert -sync file_rec/neovim<cr>
nmap <c-g> :Unite grep:.<cr>
" command! -nargs=1 Ug :Unite grep:.::<args>
nmap <leader>d :Unite -start-insert file<cr>
nmap <leader>b :Unite buffer<cr>
nmap <leader>v :Unite history/yank<cr>
nmap <leader>m :Unite file_mru<cr>
nmap <leader>n :UniteNext<cr>
nmap <leader>p :UnitePrev<cr>
nmap <leader>u :UniteResume<cr>
nmap <leader>fw :UniteWithCursorWord -buffer-name=search grep<cr>
nmap <leader>ff :call UniteFromSearch()<cr>
command! Nup :execute ":Unite -tab neobundle/update"

nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>
noremap <cr> i<Enter><esc>

" Windows resizing using arrow keys
nnoremap <silent> <Left> :vertical resize -1<CR>
nnoremap <silent> <Right> :vertical resize +1<CR>
nnoremap <silent> <Up> :resize +1<CR>
nnoremap <silent> <Down> :resize -1<CR>

" ======================================================================================================================
" 4.0 Plugin Config
" ======================================================================================================================
if neobundle#tap('unite.vim')
    let g:unite_prompt='» '
    if executable('ag')
        " let g:unite_source_rec_async_command =['ag', '--follow', '--nocolor', '--nogroup','--hidden', '-g', '']
        let g:unite_source_rec_async_command =['ag', '--vimgrep', '-g', '']
        let g:unite_source_rec_max_cache_files = 0
        call unite#custom#source('file_rec,file_rec/async,file_rec/neovim', 'max_candidates', 0)

        let g:unite_source_grep_command = 'ag'
        let g:unite_source_grep_default_opts ='-i --vimgrep --hidden'
        let g:unite_source_grep_recursive_opt = ''
    endif

    call neobundle#untap()
endif

if neobundle#tap('vim-move')
    let g:move_key_modifier = 'C'
    call neobundle#untap()
endif

if neobundle#tap('vim-airline')
    let g:airline_powerline_fonts=1
    let g:airline#extensions#tabline#enabled = 1
    call neobundle#untap()
endif

if neobundle#tap('vim-stripper')
    let g:StripperNoStripOnSave = 0
    call neobundle#untap()
endif

if neobundle#tap('deoplete.nvim')
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_smart_case = 1
    imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                \ "\<Plug>(neosnippet_expand_or_jump)"
                \: pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                \ "\<Plug>(neosnippet_expand_or_jump)"
                \: "\<TAB>"
    let g:deoplete#omni#input_patterns = {}
    let g:deoplete#omni#input_patterns.r = ['\w+']
    " let g:deoplete#omni#input_patterns.rmd = ['\w+']
    " let g:deoplete#omni#input_patterns.rnoweb = ['\w+']
    let g:deoplete#_keyword_patterns = {'_' : '[a-zA-Z_ÄÖÜäöüß]\k*'}
    call neobundle#untap()
endif

if neobundle#tap('vim-easy-align')
    vmap <Enter> <Plug>(EasyAlign)
    call neobundle#untap()
endif

if neobundle#tap('switch.vim')
    function! neobundle#hooks.on_post_source(bundle)
        let g:switch_custom_definitions = [['TRUE', 'FALSE']]
        let g:switch_mapping = ""
        nmap <silent> + :Switch<cr>
    endfunction
    call neobundle#untap()
endif

if neobundle#tap('vim-easymotion')
    let g:EasyMotion_smartcase = 1
    call neobundle#untap()
endif

if neobundle#tap('neosnippet.vim')
    let g:neosnippet#snippets_directory = expand('~/.config/nvim/neosnippets')
    if has('conceal')
        set conceallevel=2 concealcursor=i
    endif
    if !exists('g:neosnippet#scope_aliases')
        let g:neosnippet#scope_aliases = {}
    endif
    let g:neosnippet#scope_aliases['rnoweb'] = 'rnoweb,tex'
    let g:neosnippet#scope_aliases['rmd'] = 'rmd,markdown'
    call neobundle#untap()
endif

if neobundle#tap('Nvim-R')
    function! neobundle#hooks.on_source(bundle)
        let g:R_in_buffer = 1
        let g:R_assign = 0
        let g:R_applescript = 0
        let g:R_tmux_split = 0
        let g:R_nvimpager = "vertical"
        let g:R_close_term = 1
        " let g:R_latexcmd = 'latexmk -pdf -pdflatex="xelatex %O -synctex=2 %S"'
        let g:R_openpdf = 0
        if !has("mac")
            let g:R_pdfviewer = 'okular'
        endif
        let g:Rout_more_colors = 1
        let g:R_tmux_title = "automatic"
        let g:r_indent_align_args = 0
        " let g:R_show_args = 1
        " let R_args_in_stline = 1
        vmap <Space> <Plug>RDSendSelection
        nmap <Space> <Plug>RDSendLine
        let g:tex_conceal = ""
    endfunction
    call neobundle#untap()
endif

if neobundle#tap('LaTeX-Box')
    function! neobundle#hooks.on_source(bundle)
        let g:LatexBox_quickfix=2
        let g:LatexBox_ignore_warnings = ['Overfull', 'Underfull', 'Font shape', 'Some font shapes', 'Size substitutions']
        let g:tex_conceal = ""
        if has("mac")
            let g:LatexBox_viewer = "open -a Skim"
        endif
    endfunction
    function! neobundle#hooks.on_post_source(bundle)
        nmap <buffer> <f5> :LatexTOCToggle<cr>
        nmap <buffer> <leader>ce   <Plug>LatexChangeEnv
    endfunction
    call neobundle#untap()
endif


" ======================================================================================================================
" 5.0 Color and Highlight
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
