" make nvim use all vim plugins (installed by emerge)
set rtp+=/usr/share/vim/vimfiles
set rtp +=~/.vim


call plug#begin()
Plug 'Raku/vim-raku'
call plug#end()
