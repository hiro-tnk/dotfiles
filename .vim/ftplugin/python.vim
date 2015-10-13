"PyFlake
"保存時に自動でチェック
let g:PyFlakeOnWrite = 1
let g:PyFlakeCheckers = 'pep8,mccabe,pyflakes'
let g:PyFlakeDefaultComplexity=10

"syntasctic
let g:syntastic_python_checkers = ['pyflakes', 'pep8']

"deactivate syntasctic
let g:syntastic_mode_map = {
            \ 'mode': 'active',
            \ 'active_filetypes': ['php', 'coffeescript', 'sh', 'vim'],
            \ 'passive_filetypes': ['html', 'haskell', 'python']
            \}

"key for call flake8
nnoremap <silent> fl :call Flake8()
