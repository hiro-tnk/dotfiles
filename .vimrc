"set imdisable
"--------------------------------------------------------------------------
" neobundle
set nocompatible               " be iMproved
set number
filetype off


if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  " originalrepos on github
  NeoBundle 'Shougo/neobundle.vim'
  NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
      \ 'windows' : 'make -f make_mingw32.mak',
      \ 'cygwin' : 'make -f make_cygwin.mak',
      \ 'mac' : 'make -f make_mac.mak',
      \ 'unix' : 'make -f make_unix.mak',
    \ },
  \ }
  NeoBundle 'VimClojure'
  NeoBundle 'thinca/vim-quickrun'
  NeoBundle 'Shougo/vimshell'
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'Shougo/neocomplete'
  NeoBundle 'Shougo/neosnippet'
  NeoBundle 'Shougo/neosnippet-snippets'
  NeoBundle 'jpalardy/vim-slime'
  NeoBundle 'scrooloose/syntastic'
  " NeoBundle 'https://bitbucket.org/kovisoft/slimv'
  NeoBundle 'altercation/vim-colors-solarized'

  NeoBundle 'davidhalter/jedi-vim'
  NeoBundle 'hynek/vim-python-pep8-indent'
  NeoBundle 'nvie/vim-flake8'
  " NeoBundle 'Townk/vim-autoclose'
  NeoBundle 'scrooloose/syntastic'
  NeoBundle 'nathanaelkane/vim-indent-guides'
  NeoBundle 'kevinw/pyflakes-vim'
  NeoBundle "tyru/caw.vim.git"
  NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex' 
  NeoBundle "kien/rainbow_parentheses.vim"
  "対応する括弧の入力、邪魔なので消す
  "NeoBundle 'kana/vim-smartinput'
  NeoBundleCheck
  call neobundle#end()
endif
filetype plugin indent on     " required!
filetype indent on
syntax on

"RainbowParentheses
augroup MyAutoCmdFileType
    autocmd! MyAutoCmdFileType
    autocmd Filetype python :RainbowParenthesesToggle
    autocmd Filetype matlab :RainbowParenthesesToggle
augroup END
let g:rbpt_max = 7
let g:rbpt_loadcmd_toggle = 0
"caw.vim.git
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

"my setting
"左右のカーソル移動で行間移動可能にする
set whichwrap=b,s,h,l,<,>,[,]

"$,^ の置き換え
noremap <Space>h  ^
noremap <Space>l  $

" insertモードから抜ける
inoremap <silent> jj <ESC>
inoremap <silent> <C-j> j
inoremap <silent> kk <ESC>
"inoremap <silent> <C-k> k

"入力モード時に Emacs like な移動
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <silent> <C-d> <Del>
inoremap <silent> <C-a> <Esc>0<Insert>
inoremap <silent> <C-e> <Esc>$a

" neo-snippet
" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

""""""""""""""""""""""""""""""
"挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

"deactivate syntasctic
let g:syntastic_mode_map = {
            \ 'mode': 'active',
            \ 'active_filetypes': ['php', 'coffeescript', 'sh', 'vim'],
            \ 'passive_filetypes': ['html', 'haskell', 'python']
            \}

"ノーマルモードでペーストを行うと自動でペーストモードになって，
"クリップボードの中身を貼り付けてくれる．
if &term =~ "xterm"
    let &t_ti .= "\e[?2004h"
    let &t_te .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
    cnoremap <special> <Esc>[200~ <nop>
    cnoremap <special> <Esc>[201~ <nop>
endif

"------------------------------------
" neocomplete.vim
"------------------------------------
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Multibyte character
let g:neocomplete#lock_iminsert = 1
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-w>  neocomplete#cancel_popup()

" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

"jedi-vim and neocomplete
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif

" let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

" vim-indent-guides
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=110
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=140
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

"for maf
au BufRead,BufNewFile wscript set filetype=python

"setting for indent
:set tabstop=4
:set autoindent
:set expandtab
:set shiftwidth=4

