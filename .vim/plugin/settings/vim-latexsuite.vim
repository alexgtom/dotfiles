""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-latexsuite
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set grepprg=grep\ -nH\ $*
"let g:tex_flavor='latex'
"let g:Tex_ViewRule_dvi='xdvi'
"let g:Tex_CompileRule_dvi='latex --src-specials -interaction=nonstopmode $*'
"let g:Tex_UseMakefile=0

let g:tex_flavor = "latex"
let g:Tex_UseMakefile=0
let g:Tex_DefaultTargetFormat = 'dvi'
let g:Tex_CompileRule_dvi='latex --src-specials -interaction=nonstopmode $*'
"let g:Tex_ViewRule_dvi = 'xdvi -editor "vim  --servername xdvi --remote +\%l \%f" $* &'
"let g:Tex_ViewRuleComplete_dvi = 'xdvi -editor "vim --servername xdiv --remote +\%l \%f" $* &'

