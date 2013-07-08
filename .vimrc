" compatbility with vi
set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on
filetype plugin on
filetype indent on
syntax on

" change the mapleader from \ to ,
let mapleader=","

" backspace fix
set bs=2

" automomatically cd into the directory that the file is in
"set autochdir

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc

" history
set history=1000
set undolevels=1000


" bottom ruler
set ruler

" strip trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" turn off swap files
set noswapfile
set nobackup
set nowb

" persistent undo
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tab settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ts=4
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set cindent
set smartindent
set autoindent
set hlsearch

" Language specfic tab settings
autocmd FileType python 		set softtabstop=4 shiftwidth=4 expandtab
autocmd FileType html 			set softtabstop=2 shiftwidth=2 expandtab
autocmd FileType htmldjango 	set softtabstop=2 shiftwidth=2 expandtab
autocmd FileType css 			set softtabstop=2 shiftwidth=2 expandtab
autocmd FileType ejs 			set softtabstop=2 shiftwidth=2 expandtab
autocmd FileType javascript 	set softtabstop=2 shiftwidth=2 expandtab
autocmd FileType ruby           set softtabstop=2 shiftwidth=2 expandtab

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap      " Don't wrap lines
set linebreak   " Wrap lines at convenient points


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Scrolling
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Color Scheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" molokai settings
let &t_Co=256
colorscheme molokai
let g:rehash256=1
let g:molokai_original=1

" override Search color
highlight Search ctermfg=black ctermbg=yellow

" Highlight lines over line length in light blue
highlight LineOverflow cterm=underline
let w:m2=matchadd('LineOverflow', '\%>80v.\+', -1)
autocmd VimEnter * autocmd WinEnter * let w:created=1
autocmd VimEnter * let w:created=1
autocmd WinEnter * if !exists('w:created') | let w:m2=matchadd('LineOverflow', '\%>80v.\+', -1) | endif

" pyflakes error highlighting
highlight clear SpellBad
highlight SpellBad ctermbg=red ctermfg=white


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>n :NERDTreeToggle<CR>
map <leader>o :BufExplorer<cr>
map <leader>m :CtrlPMRU<CR>
nmap <leader>tb :TagbarToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Print options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tw=86
set printoptions=syntax:n,number:n,header:0,paper:letter,formfeed:y


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell Check
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType tex setlocal spell spelllang=en_us


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Omni Completition
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable omni completion. (Ctrl-X Ctrl-O)
autocmd FileType ejs,html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType c setlocal omnifunc=ccomplete#Complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete


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
autocmd FileType javascript map <F5> :call CompileRunJs()<CR>
autocmd FileType ruby map <F5> :call CompileRunRb()<CR>
autocmd FileType python map <F6> :call PyDoctest()<CR>
autocmd FileType python map <F4> :call PyInteractive()<CR>

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

func! CompileRunJs()
    exec "w"
    exec "!node %"
endfunc

func! CompileRunJava()
    exec "w"
    exec "!javac %"
    exec "!java -ea %< -oinfo initialConfig goalConfig"
endfunc

func! CompileViewLatex()
	exec "w"
	call Tex_CompileLatex()
	call ViewLatex()
endfunc

func! ViewLatex()
	exec '!xdvi -editor "vim --servername 'v:servername' --remote-wait +\%l \%f" -sourceposition ' . line(".") . substitute(expand('%:p'),expand(Tex_GetMainFileName(':p:h')).'\/','','') . " " . expand(Tex_GetMainFileName(':p:r')) . ".dvi &"
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fugitive
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufReadPost fugitive://* set bufhidden=delete

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:syntastic_python_checkers = ['pep8', 'pyflakes']
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_auto_loc_list = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_left_sep=''
let g:airline_right_sep=''

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ctrlp
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_cmd = 'CtrlPMixed'


" Load Vundle
if filereadable(expand("~/.vim/vundles.vim"))
  source ~/.vim/vundles.vim
endif
