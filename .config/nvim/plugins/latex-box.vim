let g:LatexBox_quickfix=2
let g:LatexBox_ignore_warnings = ['Overfull', 'Underfull', 'Font shape', 'Some font shapes', 'Size substitutions']
let g:tex_conceal = ""
if has("mac")
    let g:LatexBox_viewer = "open -a Skim"
endif
