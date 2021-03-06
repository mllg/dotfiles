" ======
" Plugin Manager
" ======================================================================================================================
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
let g:dein#install_log_filename = expand('~/.cache/dein-last.log')
let g:dein#types#git#default_protocol = 'ssh'
"let g:dein#types#git#clone_depth = 1

if dein#load_state(expand('~/.cache/dein'))
    call dein#begin(expand('~/.cache/dein'))
    call dein#add('Shougo/dein.vim')

    " Essentials
    call dein#add('tpope/vim-repeat') " Repeat more
    call dein#add('tpope/vim-eunuch') " Commands like :Remove
    call dein#add('tpope/vim-sensible') " Better defaults
    call dein#add('tpope/vim-endwise') " Some completions for viml/zsh/...
    call dein#add('dietsche/vim-lastplace') " restore cursor position at start

    " Appearance
    call dein#add('ryanoasis/vim-devicons')
    call dein#add('gruvbox-community/gruvbox')
    call dein#add('icymind/NeoSolarized')
    call dein#add('chriskempson/vim-tomorrow-theme')
    call dein#add('NLKNguyen/papercolor-theme')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('mhinz/vim-startify') " better start screen with bookmarks and mru
    call dein#add('equalsraf/neovim-gui-shim') " for nvim-qt
    call dein#add('christoomey/vim-tmux-navigator')
    call dein#add('tmux-plugins/vim-tmux-focus-events')
    call dein#add('kshenoy/vim-signature') " Show marks
    call dein#add('luochen1990/rainbow') " Rainbow parentheses

    " Completion
    call dein#add('roxma/nvim-yarp')
    call dein#add('ncm2/ncm2')
    call dein#add('gaalcaras/ncm-R')
    call dein#add('ncm2/ncm2-bufword')
    call dein#add('ncm2/ncm2-path')
    call dein#add('ncm2/ncm2-neosnippet')
    call dein#add('ncm2/ncm2-tmux')
    call dein#add('fgrsnau/ncm-otherbuf')

    " call dein#add('Shougo/deoplete.nvim') " Completion
    " call dein#add('Shougo/neco-vim') " vim completion
    " call dein#add('wellle/tmux-complete.vim') " complete with words from other panes
    " call dein#add('ponko2/deoplete-fish')
    " call dein#add('ujihisa/neco-look')
    " call dein#add('autozimu/LanguageClient-neovim', {'rev': 'next', 'build': 'bash install.sh'})

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
    call dein#add('Shougo/neosnippet.vim') " Snippet engine
    call dein#add('Shougo/neosnippet-snippets', {'depends' : 'neosnippet.vim'}) " Snippets
    call dein#add('mhinz/vim-sayonara', { 'on_cmd' : 'Sayonara' }) " Kill Buffers
    " call dein#add('w0rp/ale') " Linting
    call dein#add('dhruvasagar/vim-table-mode', {'on_cmd' : ['TableModeToggle']})
    call dein#add('salsifis/vim-transpose', {'on_cmd' : ['TransposeWords']})
    call dein#add('dyng/ctrlsf.vim', {'on_cmd': ['CtrlSF']})

    " Git/version control support
    call dein#add('tpope/vim-fugitive') " git support
    call dein#add('tpope/vim-rhubarb')  " github support
    call dein#add('mhinz/vim-signify') " Highlight changed lines
    " call dein#add('airblade/vim-gitgutter') " Highlight changed lines
    call dein#add('junegunn/gv.vim', {'on_cmd' : 'GV'}) " git browser
    call dein#add('jreybert/vimagit', {'on_cmd': 'Magit'}) " yet another git plugin?

    " Denite
    " call dein#add('Shougo/denite.nvim')
    " call dein#add('Shougo/neomru.vim') " mru source for unite
    " call dein#add('Shougo/neoyank.vim')

    " FZF
    call dein#add('~/.fzf')
    call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

    " FS navigation
    call dein#add('justinmk/vim-dirvish')
    call dein#add('justinmk/vim-gtfo')
    call dein#add('dbakker/vim-projectroot')

    " Languages
    call dein#add('jalvesaq/Nvim-R') ", {'on_ft' : ['r', 'rmd', 'rdoc', 'rnoweb'], 'on_path' : ['DESCRIPTION', 'NAMESPACE']} )
    call dein#add('mllg/vim-devtools-plugin', {'on_ft' : ['r', 'rmd', 'rdoc', 'rnoweb'], 'on_path' : ['DESCRIPTION', 'NAMESPACE']})
    " call dein#add('~/Projekte/vim-devtools-plugin/')

    call dein#add('lervag/vimtex', {'on_ft' : ['tex', 'Rnw']})
    call dein#add('keith/tmux.vim')
    call dein#add('dag/vim-fish')
    " call dein#add('honza/dockerfile.vim')

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
set autoread
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
set cmdheight=2
set clipboard=unnamedplus
" set conceallevel=0
set noautochdir
set shell=/bin/bash
set formatoptions+=roc

" Timeout
set timeout
set timeoutlen=750

" Completion
set completeopt=noinsert,menuone,noselect
set wildmenu
set wildignore+=.git,.svn
set wildignore+=.DS_Store
set wildignore+=*.o,*.lo

" Indent
set expandtab
set tabstop=4
set shiftwidth=0
set softtabstop=-1
set shiftround
set cindent
" set cinkeys=0{,0},0),:,!^F,o,O,e
" inoremap # X<c-h>#
set wrap
set breakindent

" Search
set inccommand=nosplit
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
function! MakeSpellFiles()
    for d in glob('~/.config/nvim/spell/*.add', 1, 1)
        if filereadable(d) && (!filereadable(d . '.spl') || getftime(d) > getftime(d . '.spl'))
            exec 'mkspell! ' . fnameescape(d)
        endif
    endfor
endfunction
augroup mkspellfiles
    autocmd!
    autocmd VimEnter * call MakeSpellFiles()
augroup END


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

augroup autoread
    autocmd!
    autocmd FocusGained * :checktime
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

" terminal
tnoremap <Esc> <C-\><C-n>

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
    set noshowmode
endif

if dein#tap('deoplete.nvim')
    set shortmess+=c
    let g:deoplete#enable_at_startup = 1

    call deoplete#custom#var('buffer', 'require_same_filetype', v:false)

    " let g:deoplete#_keyword_patterns = {'_' : '[a-zA-Z_ÄÖÜäöüß]\k*'}
    " call deoplete#custom#option('auto_complete_delay', 250)
    " call deoplete#custom#option('omni_patterns', {
    " \ 'r' : ['\h\w*::\w*', '\h\w*\$\w*', '\h\w*', '\h\w*(\w*']
    " \ })

    "\ 'r' : ['[^. *\t]\.\w*', '\h\w*::\w*', '\h\w*\$\w*', '\h\w*\w*', '\h\w*(\w*']

    imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \: pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \: "\<TAB>"
endif

if dein#tap('ncm2')
    autocmd BufEnter * call ncm2#enable_for_buffer()
    set completeopt=noinsert,menuone,noselect

    set shortmess+=c
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
endif


if dein#tap('LanguageClient-neovim')
    let g:LanguageClient_diagnosticsList = 'Location'
    let g:LanguageClient_serverCommands = {
        \ 'r': ['R', '--slave', '-e', 'languageserver::run()'],
    \ }
    let g:LanguageClient_useVirtualText=0
endif

if dein#tap('fzf.vim')
    nmap <silent> <c-o> :Files<cr>
    nmap <silent> <c-g> :Rg<space>
    nmap <silent> <leader>b :Buffers<cr>
    nmap <silent> <leader>t :Tags<cr>
    nnoremap <silent> <Leader>fw :Rg <C-R><C-W><CR>
    xnoremap <silent> <Leader>fw y:Rg <C-R>"<CR>
    " Disable fuzzy matching for grep
    command! -bang -nargs=* Rg
                \ call fzf#vim#grep(
                \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
                \   { 'options' : '--exact'},
                \   <bang>0)

    function! s:fzf_r_history()
        let l:history_file = expand('~/.Rhistory')
        call g:devtools#send_cmd('utils::savehistory("' . l:history_file . '")')
        call fzf#run({
                    \ 'source': 'cat ' . l:history_file . ' | grep -v "# \\[history skip\\]$" | uniq',
                    \ 'sink' :  g:SendCmdToR,
                    \ 'options': '--no-sort --tac',
                    \ 'down' : '40%' })
    endfunction

    command! RHistory call s:fzf_r_history()
    nmap <silent> <leader>r :RHistory<cr>
endif

if dein#tap('denite.nvim')
    function! s:denite_my_settings() abort
        nnoremap <silent><buffer><expr> <CR>
        \ denite#do_map('do_action')
        nnoremap <silent><buffer><expr> d
        \ denite#do_map('do_action', 'delete')
        nnoremap <silent><buffer><expr> p
        \ denite#do_map('do_action', 'preview')
        nnoremap <silent><buffer><expr> q
        \ denite#do_map('quit')
        nnoremap <silent><buffer><expr> i
        \ denite#do_map('open_filter_buffer')
        nnoremap <silent><buffer><expr> <Space>
        \ denite#do_map('toggle_select').'j'
    endfunction
    autocmd FileType denite call s:denite_my_settings()

    nmap <silent> <c-t> :<C-u>Denite -start-filter file/rec<cr>
    nmap <silent> <c-o> :<C-u>DeniteProjectDir -start-filter file/rec<cr>
    nmap <silent> <c-g> :<C-u>Denite -start-filter grep<cr>
    nmap <silent> <leader>b :<C-u>Denite buffer<cr>
    nmap <silent> <leader>d :<C-u>Denite directory_rec<cr>
    nmap <silent> <leader>y :<C-u>Denite neoyank<cr>
    nmap <silent> <leader>t :<C-u>Denite tag<cr>
    nmap <silent> <leader>m :<C-u>Denite file_mru<cr>
    nmap <silent> <leader>u :<C-u>Denite -resume<cr>
    nmap <silent> <leader>n :<C-u>Denite -resume -cursor-pos=+1 -immediately<cr>
    nmap <silent> <leader>p :<C-u>Denite -resume -cursor-pos=-1 -immediately<cr>
    nmap <silent> <leader>fw :<C-u>DeniteCursorWord grep<CR><CR><C-W><CR>

	call denite#custom#source('grep', 'args', ['', '', '!'])
    call denite#custom#source('grep', 'sorters', []) " keep sort order of rg

    if executable('rg')
        call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
        call denite#custom#var('grep', 'command', ['rg'])
        call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
        call denite#custom#var('grep', 'recursive_opts', [])
        call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
        call denite#custom#var('grep', 'separator', ['--'])
        call denite#custom#var('grep', 'final_opts', [])
    endif

    if executable('fd')
        call denite#custom#var('file/rec', 'command', ['fd', '--type', 'f', '--follow', '--hidden', '--exclude', '.git', ''])
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
    " let r_syntax_hl_roxygen = 0
    let g:r_indent_align_args = 0
    " let g:R_complete = 1
    " let g:R_applescript = 0
    let g:R_assign = 0
    " let g:R_close_term = 1
    " let g:R_in_buffer = 1
    let g:rout_follow_colorscheme = 1
    let g:R_nvimpager = 'horizontal'
    let g:R_openpdf = 0
    let g:R_openhtml = 0
    let R_hl_term = 1
    " let g:tex_conceal = ""
    let R_synctex = 0
    let R_latexcmd = ['pdflatex']
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
    let g:startify_bookmarks = [ {'n': '~/.config/nvim/init.vim'}, {'f': '~/.config/fish/config.fish'}, {'r': '~/.Rprofile'} ]
    let g:startify_change_to_dir = 0

    function! StartifyEntryFormat()
        return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
    endfunction
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
    let g:rootmarkers = ['DESCRIPTION','.svn','.hg','.git']
endif

if dein#tap('vim-easy-align')
    vmap <Enter> <Plug>(EasyAlign)
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)
endif

if dein#tap('vim-move')
    let g:move_map_keys = 0
    nmap <C-j> <Plug>MoveLineDown
    nmap <C-k> <Plug>MoveLineUp
    vmap <C-j> <Plug>MoveBlockDown
    vmap <C-k> <Plug>MoveBlockUp
endif

if dein#tap('ale')
    let g:ale_enabled = 0
endif

if dein#tap('vimtex')
    let g:tex_flavor = 'latex'
    let g:vimtex_compiler_progname = 'nvr'
endif

if dein#tap('far.vim')
    let g:far#window_layout = 'tab'
    let g:far#source = 'rg'

endif

if dein#tap('vim-tmux-navigator')
    let g:tmux_navigator_no_mappings = 1

    nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
    nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
    nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
    nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
    nnoremap <silent> <M-w> :TmuxNavigatePrevious<cr>
endif

if dein#tap('editorconfig-vim')
    let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
endif


if dein#tap('vim-devtools-plugin')
    let g:devtools_commands = 0
    command! -complete=dir -nargs=? RLoadPackage :call devtools#simple_cmd('load_all', <f-args>)
    command! -complete=dir -nargs=? RCheckPackage :call devtools#simple_cmd('check', <f-args>)
    command! -complete=dir -nargs=? RDocumentPackage :call devtools#simple_cmd('document', <f-args>)
    command! -complete=dir -nargs=? RClean :call devtools#simple_cmd('clean_dll', <f-args>)
    command! -complete=dir -nargs=* RTestPackage :call devtools#test(<f-args>)
    command! -complete=dir -nargs=? RMake :call devtools#make(<f-args>)
    command! -complete=dir -nargs=? RBuildPackageTags :call devtools#build_tags(<f-args>)
    command! -complete=file -nargs=? RUsage :call devtools#usage(<f-args>)
endif

" ======================================================================================================================
" Colorscheme / Terminal
" ======================================================================================================================
set background=dark
set termguicolors
if !empty($KONSOLE_PROFILE_NAME)
    set guicursor=
endif

if dein#tap('gruvbox')
    let g:gruvbox_italic=1
    colorscheme gruvbox
    hi! link rPreProc GruvboxBlue
    hi! link rFunction GruvboxAqua
    hi! link rCommentTodo GruvboxOrange
    hi! link rOperator GruvboxRed
    hi! link rLstElmt GruvboxPurple
    hi! link rOperator GruvBoxBlue
    hi! link rDelimiter GruvboxFg3
endif
