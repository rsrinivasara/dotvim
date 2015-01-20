set nocompatible

set guifont=Inconsolata-g\ for\ Powerline\ 10
" set guifont=Ubuntu\ Mono\ 11
" set guifont=Consolas\ 12
" set guifont=Bitstream\ Vera\ Sans\ Mono\ 12

set background=dark
colorscheme atom-dark

set fillchars+=vert:\|
hi vertsplit guifg=bg guibg=fg

if &diff
  " double the width up to a reasonable maximum
  let &columns = 320
  let &lines = 95
endif

" This is too obtrusive, so disabling it
" highlight OverLength ctermbg=darkred ctermfg=white guibg=#808080
" match OverLength /\%>79v.\+/

autocmd GUIEnter * set visualbell t_vb=

set lazyredraw   " don't update the display while executing macros

set encoding=utf-8
set termencoding=utf-8

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar