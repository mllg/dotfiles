call GuiWindowMaximized(1)
nmap <F11> :call GuiWindowFullScreen(!g:GuiWindowFullScreen)<cr>
set noerrorbells novisualbell t_vb=

if has("mac")
    Guifont Inconsolata for Powerline:h16
else
    Guifont Terminess Powerline:h11
endif
