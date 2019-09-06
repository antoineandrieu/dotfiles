" Download the plugin manager if not present & load the plugin install
if empty(glob('~/.vim-config/autoload/plug.vim'))
  silent !curl -fLo ~/.vim-config/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Load colorschemes & langage specific config
set runtimepath+=~/.vim-config/colors
set runtimepath+=~/.vim-config/ftplugin

" Plugin loading
call plug#begin('~/.vim/plugged')

" Language server client
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
" File navigator
Plug 'scrooloose/nerdtree'
" Display git status on the file navigator
Plug 'Xuyuanp/nerdtree-git-plugin'
" Display git status on file lines
Plug 'airblade/vim-gitgutter'
" Easy code commenting
Plug 'tpope/vim-commentary'
" Display variable and code blocks
Plug 'majutsushi/tagbar'
" Bottom line
Plug 'vim-airline/vim-airline'
" Bottom line themes
Plug 'vim-airline/vim-airline-themes'
" Close open signs
Plug 'jiangmiao/auto-pairs'
" Close HTML tags
Plug 'alvan/vim-closetag'
" Highlight hexa color definitions
Plug 'gko/vim-coloresque'
" Unified vim & tmux navigation keys
Plug 'christoomey/vim-tmux-navigator'
" Fuzzy finder
Plug '~/.fzf'

call plug#end()

" Load all configuration files
:source ~/.config/nvim/config/general.vimrc
:source ~/.config/nvim/config/mapping.vimrc
:source ~/.config/nvim/config/line.vimrc
:source ~/.config/nvim/config/plugins.vimrc
