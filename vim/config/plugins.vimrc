" Closetag filenames
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

" NERDTree configuration
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree
"
"" Automatically close last tab if its NerdTree tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeIgnore=['\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeWinSize = 35
let NERDTreeAutoDeleteBuffer = 1
" Fix interference with vim-tmux-navigator
let g:NERDTreeMapJumpPrevSibling=""
let g:NERDTreeMapJumpNextSibling=""

" Tagbar
autocmd FileType * call tagbar#autoopen(0)
nmap <silent> <F8> :TagbarToggle<CR>

let g:javascript_plugin_flow = 1

let g:javascript_plugin_jsdoc = 1

let g:airline#extensions#tagbar#enabled = 1 

let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1

let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace']
