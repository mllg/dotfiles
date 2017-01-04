call GuiWindowMaximized(1)
nmap <F11> :call GuiWindowFullScreen(!g:GuiWindowFullScreen)<cr>

if has("mac")
    Guifont Inconsolata for Powerline:h16
else
    Guifont Terminess Powerline:h12
endif
