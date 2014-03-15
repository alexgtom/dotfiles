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
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*        " Linux/MacOSX

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

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" persistent undo
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" Resize splits when the window is resized
au VimResized * :wincmd ="

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" searching
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" ctags
set tags=./tags;$HOME

" visual autocomplete for command menu
set wildmenu

set lazyredraw

" Always show the status line
set laststatus=2

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

" Language specfic tab settings
autocmd FileType python 		set softtabstop=4 shiftwidth=4 expandtab
autocmd FileType html 			set softtabstop=2 shiftwidth=2 expandtab
autocmd FileType htmldjango 	set softtabstop=2 shiftwidth=2 expandtab
autocmd FileType css 			set softtabstop=2 shiftwidth=2 expandtab
autocmd FileType ejs 			set softtabstop=2 shiftwidth=2 expandtab
autocmd FileType javascript 	set softtabstop=2 shiftwidth=2 expandtab
autocmd FileType ruby           set softtabstop=2 shiftwidth=2 expandtab
autocmd FileType cpp            set softtabstop=2 shiftwidth=2 expandtab

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap      " Don't wrap lines
"set linebreak   " Wrap lines at convenient points


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
"highlight clear SpellBad
"highlight SpellBad ctermbg=red ctermfg=white


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>n :NERDTreeToggle<CR>
map <leader>o :BufExplorer<cr>
map <leader>m :CtrlPMRU<CR>
map <C-f> :CtrlPBufTagAll<CR>
map <leader>t :TagbarToggle<CR>
map <leader>u :UndotreeToggle<CR>

nnoremap <silent> <C-b> :CtrlPBuffer<cr>

"make Y consistent with C and D
nnoremap Y y$


"Move back and forth through previous and next buffers
"with ,z and ,x
nnoremap <silent> ,z :bp<CR>
nnoremap <silent> ,x :bn<CR>


" ==============================
" Window/Tab/Split Manipulation
" ==============================
" Move between split windows by using the four directions H, L, I, N
" (note that  I use I and N instead of J and K because  J already does
" line joins and K is mapped to GitGrep the current word
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j

" <C-j> jumps in LaTeX suite, remap it to <C-g>
imap <C-g> <Plug>IMAP_JumpForward
nmap <C-g> <Plug>IMAP_JumpForward

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

"(v)im (r)eload
nmap <silent> ,vr :so %<CR>

" w!! to write a file as sudo
" stolen from Steve Losh
cmap w!! w !sudo tee % >/dev/null

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

" Clear serach results
noremap <silent><Leader>/ :nohls<CR>

" highlight line and only highlight line in one window at a time
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END


" Close the current buffer
map <leader>bd :bd<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>


" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Print options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set tw=86
"set printoptions=syntax:n,number:n,header:0,paper:letter,formfeed:y


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
let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_javascript_checkers = ['jshint']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ctrl-P
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_cmd = 'CtrlP'

" Load Vundle
if filereadable(expand("~/.vim/vundles.vim"))
  source ~/.vim/vundles.vim
endif
