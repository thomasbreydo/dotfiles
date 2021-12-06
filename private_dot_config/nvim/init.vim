" ---------------------------------------------
" Plugins
" ---------------------------------------------

" Download vim-plug if not installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugged')
Plug 'lervag/vimtex'
Plug 'doums/darcula'
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif



" ------------------------------------
"  vimtex
" ------------------------------------

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'



" ------------------------------------
"  General
" ------------------------------------

filetype plugin indent on
syntax enable
colorscheme darcula

set number relativenumber
set ruler
set wildmenu
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set ignorecase
set smartcase
set showmatch
set termguicolors
set lazyredraw 
set background=dark
set encoding=utf8
set ffs=unix
set backup
set backupdir=~/.local/share/nvim/backup//  " double-slash isn't a typo
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent

