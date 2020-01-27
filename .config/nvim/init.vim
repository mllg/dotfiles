if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo  ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


let mapleader = ','
let maplocalleader = 'ß'

call plug#begin('~/.vim/plugged')

for f in split(glob('~/.config/nvim/plugins.d/*.vim'), '\n')
    execute 'source' f
endfor

Plug 'dag/vim-fish'
Plug 'dietsche/vim-lastplace'
Plug 'ekalinin/Dockerfile.vim'
Plug 'ericpruitt/tmux.vim'
Plug 'honza/vim-snippets'
Plug 'justinmk/vim-dirvish'
Plug 'justinmk/vim-gtfo'
Plug 'lervag/vimtex'
Plug 'machakann/vim-swap'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'wellle/targets.vim'
Plug 'itspriddle/vim-stripper', {'on' : 'Stripper'}

call plug#end()
