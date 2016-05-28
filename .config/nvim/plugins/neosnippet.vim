let g:neosnippet#snippets_directory = expand('~/.config/nvim/neosnippets')
if !exists('g:neosnippet#scope_aliases')
    let g:neosnippet#scope_aliases = {}
endif
let g:neosnippet#scope_aliases['rnoweb'] = 'rnoweb,tex'
let g:neosnippet#scope_aliases['rmd'] = 'rmd,markdown'
