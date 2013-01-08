set nocompatible
set ruler
"let &t_Co=256
"set background=dark
"colorscheme solarized
"let g:solarized_termcolors=256
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 	User
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on
filetype plugin on
filetype indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Tab settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ts=4
set tabstop=4 
set shiftwidth=4 
"set expandtab
set cindent 
set smartindent
set autoindent
set hlsearch

"   Language specfic tab settings
autocmd FileType python 		set softtabstop=4 shiftwidth=4 expandtab 
autocmd FileType html 			set softtabstop=2 shiftwidth=2 expandtab 
autocmd FileType css 			set softtabstop=2 shiftwidth=2 expandtab 
autocmd FileType ejs 			set softtabstop=2 shiftwidth=2 expandtab 
autocmd FileType javascript 	set softtabstop=2 shiftwidth=2 expandtab 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 	Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F7> :TlistToggle<CR>
map <F8> :NERDTreeToggle<CR> 
set pastetoggle=<F3>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Backups (.swp)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set dir=~/.vimbackup

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
call pathogen#infect()
" Allow the cursor to go in to "invalid" places
"set virtualedit=all

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 	Word Wrap
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set formatoptions=l
set lbr

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 	Spell Check
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType tex setlocal spell spelllang=en_us

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 	History
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=1000
set undolevels=1000


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Key Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	map <F10> :TlistToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Compiler Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd FileType c map <F5> :call CompileRunGcc()<CR>
autocmd FileType c map <F6> :call DebugGcc()<CR>
autocmd FileType cpp map <F5> :call CompileRunGpp()<CR>
autocmd FileType cpp map <F6> :call DebugGpp()<CR>
autocmd FileType php map <F5> :!php -l %<CR>
autocmd FileType java map <F5> :call CompileRunJava()<CR>
autocmd FileType tex map <F6> :call CompileViewLatex()<CR>
autocmd FileType tex map <F8> :call CompilePdfLatex()<CR>
autocmd FileType python map <F5> :call CompileRunPy()<CR>
autocmd FileType lg map <F5> :call CompileRunLg()<CR>
autocmd FileType ruby map <F5> :call CompileRunRb()<CR>
autocmd FileType python map <F6> :call PyDoctest()<CR>
autocmd FileType python map <F4> :call PyInteractive()<CR>

func! CompileViewLatex()
	exec "w"
	exec "!pdflatex %"
endfunc

func! CompileRunGcc()
 	exec "w"
    "exec "!clang % -o %<"
	exec "!clang -march=native -Wall -O2 -std=c99 % -o %<"
	exec "!./%<"
endfunc

func! DebugGcc()
 	exec "w"
    exec "!clang % -o %< -w -g"
    exec "!valgrind --tool=memcheck --leak-check=yes %<"
	exec "! ./%<"
endfunc

func! CompileRunGpp()
 	exec "w"
    exec "!g++ % -o %< -Wall"
	exec "! ./%<"
endfunc

func! DebugGpp()
 	exec "w"
    exec "!g++ % -o %< -w -g"
    exec "!valgrind --tool=memcheck --leak-check=yes %<"
	exec "! ./%<"
endfunc

func! CompileRunJava()
    exec "w"
    exec "!javac %"
    exec "!java -ea %< -oinfo initialConfig goalConfig"
endfunc

func! CompileViewLatex()
	exec "w"
	call Tex_CompileLatex()
	call Tex_ForwardSearchLaTeX()
endfunc

func! CompilePdfLatex()
	exec "w"
	exec "!pdflatex %"
endfunc

func! CompileRunPy()
	exec "w"
	exec "!python %"
endfunc

func! CompileRunRb()
	exec "w"
	exec "!ruby %"
endfunc

func! CompileRunLg()
	exec "w"
	exec "!logo %"
endfunc

func! PyDoctest()
	exec "w"
	exec "!python -m doctest -v %"
endfunc

func! PyInteractive()
	exec "w"
	exec "!python -i %"
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 	Print options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tw=86
set printoptions=syntax:n,number:n,header:0,paper:letter,formfeed:y

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 	vim-latexsuite
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_ViewRule_dvi='xdvi'
let g:Tex_CompileRule_dvi='latex --src-specials -interaction=nonstopmode $*'
let g:Tex_UseMakefile=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Changes comment color
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight Comment ctermfg=blue

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Pydiction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pydiction_location = '~/.vim/ftplugin/pydiction/complete-dict'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	PyFlakes	
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight clear SpellBad
highlight SpellBad ctermbg=red ctermfg=white

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Highlight lines over line length in light blue
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight LineOverflow ctermbg=blue ctermfg=white guibg=#592929
let w:m2=matchadd('LineOverflow', '\%>80v.\+', -1)
autocmd VimEnter * autocmd WinEnter * let w:created=1
autocmd VimEnter * let w:created=1
autocmd WinEnter * if !exists('w:created') | let w:m2=matchadd('LineOverflow', '\%>80v.\+', -1) | endif
