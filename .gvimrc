"setting for colorscheme soralized
syntax enable
set background=light
colorscheme solarized

"IME on のときカーソルの色を変える。
if has('multi_byte_ime') || has('xim') 
  highlight CursorIM guifg=NONE guibg=DarkRed
endif

" ウインドウの幅
set columns=120
" ウインドウの高さ
set lines=60

set imdisable
