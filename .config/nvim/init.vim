" ======================================================================================================================
" Plugin Manager
" ======================================================================================================================
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
let g:dein#install_log_filename = expand('~/.cache/dein-last.log')
let g:dein#types#git#clone_depth = 1

if dein#load_state(expand('~/.cache/dein'))
    call dein#begin(expand('~/.cache/dein'))
    call dein#add('Shougo/dein.vim')

    " Essentials
    call dein#add('tpope/vim-repeat') " Repeat more
    call dein#add('tpope/vim-abolish') " Case insensitive replace
    call dein#add('tpope/vim-eunuch') " Commands like :Remove
    call dein#add('tpope/vim-sensible') " Better defaults
    call dein#add('tpope/vim-endwise') " Some completions for viml/zsh/...
    call dein#add('dietsche/vim-lastplace') " restore cursor position at start
    call dein#add('thinca/vim-prettyprint', {'on_cmd' : 'PrettyPrint'}) " pretty print vim variables

    " Appearance
    call dein#add('morhetz/gruvbox')
    call dein#add('icymind/NeoSolarized')
    call dein#add('chriskempson/vim-tomorrow-theme')
    call dein#add('NLKNguyen/papercolor-theme')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('mhinz/vim-startify') " better start screen with bookmarks and mru
    call dein#add('equalsraf/neovim-gui-shim') " for nvim-qt
    " call dein#add('christoomey/vim-tmux-navigator')
    call dein#add('kshenoy/vim-signature') " Show marks

    " Completion
    call dein#add('Shougo/deoplete.nvim', {'on_i': 1}) " Completion
    call dein#add('Shougo/neco-vim') " vim completion
    call dein#add('ujihisa/neco-look') " dict lookup
    call dein#add('wellle/tmux-complete.vim') " complete with words from other panes

    " Edit helpers
    call dein#add('editorconfig/editorconfig-vim') " Support for editorconfig
    call dein#add('matze/vim-move') " Move lines with <c-h> etc
    call dein#add('itspriddle/vim-stripper', {'on_cmd' : 'Stripper'}) " Remove trailing whitespace
    call dein#add('christoomey/vim-titlecase') " switch titlecase with gt+movement
    call dein#add('tpope/vim-commentary') " Comment with gc
    call dein#add('tpope/vim-surround') " Delete, add and change surroundings
    call dein#add('wellle/targets.vim') " More text objects
    call dein#add('michaeljsmith/vim-indent-object') " Indentation objects for targets
    call dein#add('junegunn/vim-easy-align') " Align on operators
    call dein#add('AndrewRadev/switch.vim') " Switch values like true/false with gs
    call dein#add('machakann/vim-swap') " swap arguments with g< and g>
    call dein#add('vim-scripts/ReplaceWithRegister') " replace motion with register using gr<motion>
    call dein#add('triglav/vim-visual-increment') " Increment numbers in visual mode
    call dein#add('Shougo/neosnippet.vim', {'on_i' : 1}) " Snippet engine
    call dein#add('Shougo/neosnippet-snippets', {'depends' : 'neosnippet.vim'}) " Snippets
    call dein#add('mhinz/vim-sayonara', { 'on_cmd' : 'Sayonara' })
    call dein#add('brooth/far.vim', {'on_cmd' : ['Far', 'FarDo', 'Farundo']}) " Find And Replace
    call dein#add('w0rp/ale') " Linting
    call dein#add('Shougo/neoyank.vim') " denite source for yank

    " Git/version control support
    call dein#add('tpope/vim-fugitive') " git support
    call dein#add('tpope/vim-rhubarb')  " github support
    call dein#add('airblade/vim-gitgutter') " Highlight changed lines
    call dein#add('junegunn/gv.vim', {'on_cmd' : 'GV'}) " git browser

    " File system navigation
    call dein#add('Shougo/denite.nvim')
    call dein#add('Shougo/neomru.vim') " mru source for unite
    call dein#add('justinmk/vim-dirvish')
    call dein#add('justinmk/vim-gtfo')
    call dein#add('dbakker/vim-projectroot')

    " Languages
    call dein#add('jalvesaq/Nvim-R', {'on_ft' : ['r', 'rmd', 'rdoc', 'rnoweb'], 'on_path' : ['DESCRIPTION', 'NAMESPACE']})
    " call dein#add('/home/lang/Projekte/vim-devtools-plugin')
    call dein#add('mllg/vim-devtools-plugin', {'on_ft' : ['r', 'rmd', 'rdoc', 'rnoweb'], 'on_path' : ['DESCRIPTION', 'NAMESPACE']})
    call dein#add('lervag/vimtex', {'on_ft' : ['tex', 'Rnw']})
    call dein#add('octol/vim-cpp-enhanced-highlight')
    call dein#add('keith/tmux.vim')
    call dein#add('dag/vim-fish')
    call dein#add('honza/dockerfile.vim')

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif


filetype plugin indent on
syntax on


" ======================================================================================================================
" Settings
" ======================================================================================================================
set cursorline
set synmaxcol=1024
set number
set norelativenumber
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
set shortmess=aIT
set mouse=a
set clipboard=unnamedplus
set conceallevel=0
set noautochdir

" Timeout
set timeout
set timeoutlen=750

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
set smartindent
set cinkeys=0{,0},0),:,!^F,o,O,e
set wrap
set breakindent
inoremap # X<c-h>#

" Search
set inccommand=nosplit
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

function! MakeSpellFiles()
    for d in glob('~/.config/nvim/spell/*.add', 1, 1)
        if filereadable(d) && (!filereadable(d . '.spl') || getftime(d) > getftime(d . '.spl'))
            exec 'mkspell! ' . fnameescape(d)
        endif
    endfor
endfunction

function! <SID>AutoProjectRootCD()
    try
        if &ft != 'help'
            ProjectRootCD
        endif
    catch
        " Silently ignore invalid buffers
    endtry
endfunction

augroup projectroot
    autocmd!
    autocmd BufEnter * call <SID>AutoProjectRootCD()
augroup END

augroup help_pages
    autocmd!
    autocmd FileType help nested call MoveHelpRight()
augroup END

function! SetTermOptions()
    set nobuflisted
    setlocal scrollback=100000
    setlocal nonumber
endfunction

augroup terminal_fixes
    autocmd TermOpen * call SetTermOptions()
augroup END

augroup spellcheck_on
    autocmd!
    autocmd FileType gitcommit,tex,rmd,markdown,rnoweb setlocal spell
augroup END

augroup ftdetect_fixes
    autocmd!
    autocmd BufNewFile,BufReadPost *.Rmd set filetype=rmd
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
augroup END

augroup comment_string
    autocmd!
    autocmd FileType r setlocal commentstring=#\ %s
    autocmd FileType rnoweb setlocal commentstring=%\ %s
augroup END

augroup mkspellfiles
    autocmd!
    autocmd VimEnter * call MakeSpellFiles()
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
inoremap <m-h> <left>
inoremap <m-l> <right>
vnoremap < <gv
vnoremap > >gv

nnoremap Y y$
nnoremap Q @q
nnoremap <backspace> :Sayonara!<cr>
nnoremap <Del> :Sayonara<cr>
vnoremap . :normal .<cr>

" Keep search matches in the middle of the screen.
nnoremap n nzz
nnoremap N Nzz

" After block yank and paste, move cursor to the end of operated text
" Also, don't copy over-pasted text in visual mode
vnoremap y y`]
vnoremap p "_dP`]
nnoremap p p`]

nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Windows resizing using arrow keys
nnoremap <silent> <M-Left> :vertical resize -1<CR>
nnoremap <silent> <M-Right> :vertical resize +1<CR>
nnoremap <silent> <M-Up> :resize +1<CR>
nnoremap <silent> <M-Down> :resize -1<CR>

function s:UpdatePlugins()
    call delete(g:dein#install_log_filename)
    call dein#update()
endfunction
command Update call s:UpdatePlugins()

command Cleanup call map(dein#check_clean(), "delete(v:val, 'rf')")
command Print exec ':hardcopy >~/vimprint.ps'
nmap <F9> :Gstatus<cr>


" ======================================================================================================================
" Plugin Config
" ======================================================================================================================
if dein#tap('vim-airline')
    let g:airline_powerline_fonts = 1
    let g:airline_extensions = ['branch', 'tabline', 'quickfix', 'whitespace', 'wordcount']
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_highlighting_cache = 1
endif

if dein#tap('deoplete.nvim')
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_smart_case = 1

    imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \: pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \: "\<TAB>"
    nmap <leader>c :let g:deoplete#disable_auto_complete=!g:deoplete#disable_auto_complete<cr>
endif

if dein#tap('denite.nvim')
    nmap <silent> <c-t> :<C-u>Denite file_rec<cr>
    nmap <silent> <c-o> :<C-u>DeniteProjectDir file_rec<cr>
    nmap <silent> <c-g> :<C-u>Denite grep<cr>
    nmap <silent> <leader>b :<C-u>Denite buffer<cr>
    nmap <silent> <leader>d :<C-u>Denite directory_rec<cr>
    nmap <silent> <leader>y :<C-u>Denite neoyank<cr>
    nmap <silent> <leader>u :<C-u>Denite -resume<cr>
    nmap <silent> <leader>n :<C-u>Denite -resume -select=+1 -immediately<cr>
    nmap <silent> <leader>p :<C-u>Denite -resume -select=-1 -immediately<cr>
    nmap <silent> <leader>m :<C-u>Denite -start-insert file_mru<cr>
    nmap <silent> <leader>fw :<C-u>DeniteCursorWord grep<CR><CR><C-W><CR>

    call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
    call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
    call denite#custom#option('default', 'statusline', 0)

    if executable('rg')
        call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git'])
        call denite#custom#var('grep', 'command', ['rg'])
        call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
        call denite#custom#var('grep', 'recursive_opts', [])
        call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
        call denite#custom#var('grep', 'separator', ['--'])
        call denite#custom#var('grep', 'final_opts', [])
    elseif executable('ag')
        call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
        call denite#custom#var('grep', 'command', ['ag'])
        call denite#custom#var('grep', 'default_opts', ['--vimgrep'])
        call denite#custom#var('grep', 'recursive_opts', [])
        call denite#custom#var('grep', 'pattern_opt', [])
        call denite#custom#var('grep', 'separator', ['--'])
        call denite#custom#var('grep', 'final_opts', [])
    endif
endif

if dein#tap('neosnippet.vim')
    let g:neosnippet#snippets_directory = expand('~/.config/nvim/neosnippets')
    if !exists('g:neosnippet#scope_aliases')
        let g:neosnippet#scope_aliases = {}
    endif
    let g:neosnippet#scope_aliases['rnoweb'] = 'rnoweb,tex'
    let g:neosnippet#scope_aliases['rmd'] = 'rmd,markdown'
endif

if dein#tap('Nvim-R')
    let g:R_complete = 2
    let g:R_applescript = 0
    let g:R_assign = 0
    let g:R_close_term = 1
    let g:R_in_buffer = 1
    let g:R_tmux_split = 0
    let g:rout_follow_colorscheme = 1
    let g:R_nvimpager = "horizontal"
    let g:R_openpdf = 1
    let g:R_tmux_title = "automatic"
    let R_hl_term = 1
    let g:r_indent_align_args = 0
    let g:tex_conceal = ""
    let R_synctex = 0
    if !has("mac")
        let g:R_pdfviewer = 'okular'
    endif
    vmap <Space> <Plug>RDSendSelection
    nmap <Space> <Plug>RDSendLine
endif

if dein#tap('switch.vim')
    let g:switch_custom_definitions = [['TRUE', 'FALSE']]
    let g:switch_mapping = ""
    nmap <silent> + :Switch<cr>
endif


if dein#tap('vim-startify')
    nmap <F2> :Startify<cr>
    let g:startify_bookmarks = [ {'n': '~/.config/nvim/init.vim'}, {'f': '~/.config/fish/config.fish'} ]
    let g:startify_change_to_dir = 0
endif

if dein#tap('vim-surround')
    " yank command surrounding, useful for tex and Rd -> ys[motion]c
    let g:surround_99 = "\\\1cmd\1{\r}"
endif

if dein#tap('vim-gtfo')
    let g:gtfo#terminals = { 'unix' : 'konsole --workdir' }
endif

if dein#tap('vim-projectroot')
    nnoremap <leader>cp :ProjectRootCD<cr>
endif

if dein#tap('vim-easy-align')
    vmap <Enter> <Plug>(EasyAlign)
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)
endif

if dein#tap('vim-move')
    let g:move_key_modifier = 'C'
endif

if dein#tap('ale')
    let g:ale_enabled = 0
    set shell=/bin/bash
endif

if dein#tap('vimtex')
    if filereadable(expand('~/.local/bin/nvr'))
        let g:vimtex_compiler_progname = '/home/lang/.local/bin/nvr'
    endif
endif

" ======================================================================================================================
" Colorscheme / Terminal
" ======================================================================================================================
set background=dark
set t_Co=256
if has("termguicolors")
    set termguicolors
endif

if !empty($KONSOLE_PROFILE_NAME)
    set guicursor=
endif

if dein#tap('gruvbox')
    colorscheme gruvbox
    hi! link rPreProc GruvboxBlue
    hi! link rFunction GruvboxAqua
    hi! link rCommentTodo GruvboxOrange
    hi! link rOperator GruvboxRed
    hi! link rLstElmt GruvboxPurple
    hi! link rOperator GruvBoxBlue
    hi! link rDelimiter GruvboxFg3
endif
