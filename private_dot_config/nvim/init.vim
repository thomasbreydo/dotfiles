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
Plug 'honza/vim-snippets'

Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
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
let g:vimtex_view_method='skim'
let g:vimtex_view_skim_activate=1
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'


" ------------------------------------
"  LSP
" ------------------------------------

lua << EOF
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'ultisnips' }, -- For ultisnips users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  require('lspconfig')['texlab'].setup {
    capabilities = capabilities
  }
EOF



" ------------------------------------
"  Keymaps
" ------------------------------------

let mapleader = " "

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

nmap <leader>xe :edit ~/Library/texmf/tex/latex/thomas.sty<cr>

nmap <leader>re :edit ~/.local/share/chezmoi/run_after_post-apply.sh.tmpl<cr>






" ------------------------------------
"  Syntax
" ------------------------------------

colorscheme darcula
highlight! clear Conceal

filetype plugin indent on
syntax on

" ------------------------------------
"  General
" ------------------------------------

set list
set listchars=tab:▸\ ,trail:·
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

