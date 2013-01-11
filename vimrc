""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" change the mapleader from \ to ,
let mapleader=","

" backspace fix
set bs=2

" pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" automomatically cd into the directory that the file is in
set autochdir 

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc

" history
set history=1000
set undolevels=1000

" compatbility with vi
set nocompatible

" bottom ruler
set ruler

" syntax
syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Color Scheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let &t_Co=256
colorscheme molokai
let g:molokai_original=0
"set background=dark
"colorscheme solarized
"let g:solarized_termcolors=256

" override comment color
"highlight Comment ctermfg=blue

" override Search color
highlight Search ctermfg=black ctermbg=yellow

" backup dir
set dir=~/.vimbackup

" Highlight lines over line length in light blue
highlight LineOverflow ctermbg=blue ctermfg=white guibg=#592929
let w:m2=matchadd('LineOverflow', '\%>80v.\+', -1)
autocmd VimEnter * autocmd WinEnter * let w:created=1
autocmd VimEnter * let w:created=1
autocmd WinEnter * if !exists('w:created') | let w:m2=matchadd('LineOverflow', '\%>80v.\+', -1) | endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on
filetype plugin on
filetype indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tab settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ts=4
set tabstop=4 
set shiftwidth=4 
set expandtab
set cindent 
set smartindent
set autoindent
set hlsearch

" Language specfic tab settings
autocmd FileType python 		set softtabstop=4 shiftwidth=4 expandtab 
autocmd FileType html 			set softtabstop=2 shiftwidth=2 expandtab 
autocmd FileType css 			set softtabstop=2 shiftwidth=2 expandtab 
autocmd FileType ejs 			set softtabstop=2 shiftwidth=2 expandtab 
autocmd FileType javascript 	set softtabstop=2 shiftwidth=2 expandtab 
autocmd FileType ruby           set softtabstop=2 shiftwidth=2 expandtab 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>tl :TlistToggle<CR>
map <leader>n :NERDTreeToggle<CR> 
set pastetoggle=<F3>
map <leader>o :BufExplorer<cr>
map <leader>m :MRU<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Word Wrap
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set formatoptions=l
set lbr


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
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete


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

"func! CompileViewLatex()
"	exec "w"
"	exec "!pdflatex %"
"endfunc

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
" => Print options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tw=86
set printoptions=syntax:n,number:n,header:0,paper:letter,formfeed:y

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
" => Pydiction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pydiction_location = '~/.vim/ftplugin/pydiction/complete-dict'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PyFlakes	
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight clear SpellBad
highlight SpellBad ctermbg=red ctermfg=white

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command T
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let CommandTMaxFiles = 20000
nnoremap <silent> <Leader>t :CommandT<CR>
nnoremap <silent> <Leader>b :CommandTBuffer<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fugitive
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufReadPost fugitive://* set bufhidden=delete
"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Powerline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Powerline_symbols = 'compatible'
set encoding=utf8
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'jcf/vim-latex'
Bundle 'sukima/xmledit'
Bundle 'wincent/Command-T'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/javacomplete'
Bundle 'vim-scripts/pythoncomplete'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/syntastic'
Bundle 'Rip-Rip/clang_complete'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-pathogen'
Bundle 'tpope/vim-surround'
Bundle 'ervandew/supertab'
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'vim-scripts/mru.vim'
Bundle 'vim-scripts/taglist.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-haml'
Bundle 'groenewege/vim-less'
Bundle 'tpope/vim-endwise'
Bundle 'scrooloose/nerdcommenter'
