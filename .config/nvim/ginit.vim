call GuiWindowMaximized(1)
nmap <F11> :call GuiWindowFullScreen(!g:GuiWindowFullScreen)<cr>
set noerrorbells visualbell t_vb=

if has("mac")
    Guifont Inconsolata for Powerline:h16
else
    Guifont Hack Nerd Font Mono:h12
endif
