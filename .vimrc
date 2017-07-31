
" General {{{ "

" Environmenti - Encoding, Indent, Fold {{{ "


" set help to chinese
if version >= 603
    set helplang=cn
    set fileencoding=utf-8
endif


set nocompatible " be requied

set title
set ttyfast

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=

set t_Co=256 " using 256 colors
set guicursor+=a:block-blinkon0 " no cursor blink

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" use the mouse
" set mouse=a

" set utf-8 as standard encoding
set encoding=utf8

" set terminal encoding
set termencoding=utf-8

" use unix as the standard file type
set fileformats=unix,dos
set ambiwidth=double
set nowrap " no wrap line
set foldlevel=100 " unfold all by default

filetype on
filetype plugin on
filetype plugin indent on

set autoindent " suto indent
set smartindent " smart indent
set expandtab " use spaces instead of tab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set smarttab

" }}} Environment - Encoding, Indent, Fold "

" Appearence - Scrollbar, Highlight, Numberline {{{ "

" disable scorllbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" customize gui fontfamily and fontsize
set guifont=YaHei\ Consolas\ Hybrid\ 11.5

syntax enable
syntax on
" colorscheme
set background=dark
" colorscheme NeoSolarized
" set termguicolors
colorscheme solarized

" Highlight current line
set cursorline
set number relativenumber

" Always show current position
set ruler

" turn spell check off
set nospell

" set cmdheight=1
" set wildmenu
" set wildmode=list:longest,full
" set wildignore=*.o,*.swp,*.pyc,*.pyo,*.class,*.zip

" }}} Appearence - Scrollbar, Highlight, Numberline "

" Edit - Navigation, History, Search {{{ "

set virtualedit=onemore

" Restore last session automatically (Default Off)
autocmd VimEnter * :call RestoreLastSession()
function! RestoreLastSession()
    if exists('g:restorelastsession')
        if filereadable(expand("~/.vim/.last.session"))
           exe ":source ~/.vim/.last.session"
       endif
   endif
endfunction

if filereadable(expand("~/.vim/.last.session"))
    nmap <silent> <Leader>r :source ~/.vim/.last.session<CR>
endif

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \     exe "normal! g`\"" |
            \ endif

set autoread " auto read when a file is changed from the outside
set autowrite " Automatically write a file when leaving a modified buffer
set updatetime=5000

set history=1000

set nobackup
set nowritebackup

" Turn persistent undo on, means that you can undo even when you close a buffer/VIM
set undofile
set undolevels=1000
set undoreload=1000

if !isdirectory(expand("~/.vim/undotree"))
    call mkdir($HOME . "/.vim/undotree", "p")
endif
set undodir=~/.vim/undotree

set magic
set ignorecase
set smartcase
set hlsearch
set nowrapscan

" }}} Edit - Bavigation, History, Search "

" Buffer - BufferSwitch, FileExplorer, StatusLine {{{ "

set laststatus=2
" set statusline=%<%f\ "filename
" set statusline+=%w%h%m%r " option
" set statusline+=\ [%{&ff}]/%y " fileformat/filetype
" set statusline+=\ [%{getcwd()}] " current dir
" set statusline+=\ [%{&encoding}] " encoding
" set statusline+=%=%-14.(%l/%L,%c%V%)\ %p%% " Right aligned file nav info

" }}} Buffer - BufferSwitch, FileExplorer, StatusLine "

" Key Mappings {{{ "

" }}} Key Mappings "

" Misc {{{ "

set noshowcmd
set showmatch
set matchtime=2

" }}} Misc "

" }}} General "

" Plugins List & Config {{{ "

" Plugin List {{{ "

" Vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" Vundle 管理的插件列表必须在vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'mbbill/undotree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()
filetype plugin indent on

" }}} Plugin List "

" Plugin Config - undotree {{{ "
if filereadable(expand("~/.vim/bundle/undotree/plugin/undotree.vim"))
     let g:undotree_SplitWidth = 40
     let g:undotree_SetFocusWhenToggle = 1
     nmap <silent> U :UndotreeToggle<CR>
endif
" }}} Plugin Config - undotree "


" Plugin Config - airline {{{ "
if filereadable(expand("~/.vim/bundle/vim-airline/plugin/airline.vim"))
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_theme='molokai'
endif
" }}} Plugin Config - airline "

" }}} Plugins List & Config "
