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
" => Syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:syntastic_python_checkers = ['pep8', 'pyflakes']
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_auto_loc_list = 1


" Load Vundle
if filereadable(expand("~/.vim/vundles.vim"))
  source ~/.vim/vundles.vim
endif
