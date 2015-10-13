cnoremap texvim e $HOME/.vim/ftplugin/tex.vim
inoremap {} {}<LEFT>
inoremap $$ $$<LEFT>
inoremap ¥ \
inoremap bunsu \frac{1}{2}<LEFT><LEFT><LEFT><LEFT>
inoremap () \left(  \right)<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>

" Run LaTeX through TexShop
function! SRJ_runLatex()
   if &ft != 'tex'
      echo "calling srj_runLatex from a non-tex file"
      return ''
   endif

   "write the file
   :w

   let thePath = getcwd() .'/'. expand("%")

   let execString = 'osascript -e "tell app \"TeXShop\"" -e "set theDoc to open ((POSIX file \"'.thePath.'\") as alias)" -e "tell theDoc to typesetinteractive" -e "end tell"'
   exec 'silent! !'.execString
   return ''
endfunction
noremap <expr> <D-r> SRJ_runLatex()
vnoremap  <expr> <D-r> SRJ_runLatex()
inoremap <expr> <D-r> SRJ_runLatex()


""
"" Vim-LaTeX
""
filetype plugin on
filetype indent on
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Imap_UsePlaceHolders = 1
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='dvi,pdf'
"let g:Tex_FormatDependency_pdf = 'pdf'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
"let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
let g:Tex_FormatDependency_ps = 'dvi,ps'
let g:Tex_CompileRule_pdf = '/usr/texbin/ptex2pdf -u -l -ot "-synctex=1 -interaction=nonstopmode -file-line-error-style" $*'
"let g:Tex_CompileRule_pdf = '/usr/texbin/pdflatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = '/usr/texbin/lualatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = '/usr/texbin/luajitlatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = '/usr/texbin/xelatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = '/usr/local/bin/ps2pdf $*.ps'
let g:Tex_CompileRule_ps = '/usr/texbin/dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_dvi = '/usr/texbin/uplatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_BibtexFlavor = '/usr/texbin/upbibtex'
let g:Tex_MakeIndexFlavor = '/usr/texbin/mendex -U $*.idx'
let g:Tex_UseEditorSettingInDVIViewer = 1
" let g:Tex_ViewRule_pdf = 'Skim'
"let g:Tex_ViewRule_pdf = '/usr/bin/open -a Skim.app'
"let g:Tex_ViewRule_pdf = '/usr/bin/open -a Preview.app'
"let g:Tex_ViewRule_pdf = '/usr/bin/open -a TeXShop.app'
"let g:Tex_ViewRule_pdf = '/Applications/TeXworks.app/Contents/MacOS/TeXworks'
"let g:Tex_ViewRule_pdf = '/Applications/texstudio.app/Contents/MacOS/texstudio --pdf-viewer-only'
"let g:Tex_ViewRule_pdf = '/usr/bin/open -a Firefox.app'
"let g:Tex_ViewRule_pdf = '/usr/bin/open -a "Adobe Reader.app"'
"let g:Tex_ViewRule_pdf = '/usr/bin/open'


" tex_conceal を無効化
let g:tex_conceal = ""

