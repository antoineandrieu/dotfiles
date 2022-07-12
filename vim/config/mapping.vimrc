" Windows navigation
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" Arrow keys for buffer movement
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

" Save file
noremap <leader>s :w<CR>
inoremap <leader>s <Esc>:w<CR>

noremap <leader>q :wqa<CR>
inoremap <leader>q <Esc>:wqa<CR>

noremap <leader>d :bd<CR>
inoremap <leader>d <Esc>:bd<CR>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Reload current file with F5
nnoremap <F5> :edit!<CR>

" Source current file with double F5
nnoremap <F5><F5> :source %<CR>

" fzf
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-m> :Lines<CR>
nnoremap <silent> <C-b> :BLines<CR>


" Git
nmap ghp <Plug>(GitGutterPreviewHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghs <Plug>(GitGutterStageHunk)
xmap ghs <Plug>(GitGutterStageHunk)

noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

map <C-c> "+y
map <C-v> "+p
