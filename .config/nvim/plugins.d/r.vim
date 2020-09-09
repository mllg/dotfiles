Plug 'jalvesaq/R-Vim-runtime'
Plug 'jalvesaq/Nvim-R', { 'for': ['r', 'rmd'] }
Plug 'mllg/vim-devtools-plugin', { 'for': ['r', 'rmd'] }

let g:r_syn_minlines = 100
let g:r_syntax_hl_roxygen = 1

let g:r_indent_align_args = 0
let g:R_assign = 0
let Rout_more_colors = 1
let g:rout_follow_colorscheme = 1
" let R_hi_fun_paren = 1 " might be slow according to docs
let g:R_nvimpager = 'horizontal'
let g:R_openpdf = 0
let g:R_openhtml = 0
let R_hl_term = 1
let R_synctex = 0
let R_latexcmd = ['latexmk', '-pdf', '-pdflatex="xelatex %O -synctex=1 %S"']

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

" function! s:fzf_r_history()
"     let l:history_file = expand('~/.Rhistory')
"     call g:devtools#send_cmd('utils::savehistory("' . l:history_file . '")')
"     call fzf#run(fzf#wrap({
"                 \ 'source': 'cat ' . l:history_file . ' | grep -v "# \\[history skip\\]$" | uniq',
"                 \ 'sink' :  g:SendCmdToR,
"                 \ 'options': '--no-sort --tac'}))
" endfunction

" command! RHistory call s:fzf_r_history()
" nmap <silent><leader>r :RHistory<cr>
"

