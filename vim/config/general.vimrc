syntax enable

set mouse=a

set nobomb

" Color scheme
" colorscheme purify
" set background=dark
colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE
" hi LineNr guibg=NONE ctermbg=NONE
" hi LineNr guifg=Grey ctermfg=59

set nocompatible
set runtimepath+=/home/antoine/.vim-config/ftplugin
filetype plugin on
filetype plugin indent on
set colorcolumn=79
" highlight ColorColumn ctermbg=8
" set autoread

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Always show signcolumns
set signcolumn=yes
set number

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" Fix backspace indent
set backspace=indent,eol,start

" Map leader to ,
let mapleader=','

" Enable hidden buffers
set hidden

" Searching
set hlsearch
set ignorecase
set smartcase

" Encoding
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,latin1
endif
" set binary

" Directories for swp files
set nobackup
set noswapfile
set nowritebackup

set fileformats=unix,dos,mac
set showcmd
set shell=/bin/zsh

" Session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "yes"
let g:session_autosave = "yes"
let g:session_command_aliases = 1

" Change directory to current opened file
" autocmd BufEnter * lcd %:p:h
