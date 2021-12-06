" Windows navigation
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" Arrow keys for buffer movement
noremap <c-left> :bp<CR>
noremap <c-right> :bn<CR>

" Save file
:noremap <c-s> :w<CR>
:inoremap <c-s> <Esc>:w<CR>a

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Reload current file with F5
nnoremap <F5> :edit!<CR>

" Source current file with double F5
nnoremap <F5><F5> :source %<CR>

" fzf
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-m> :Lines<CR>
nnoremap <silent> <C-b> :BLines<CR>


" Git
nmap ghp (GitGutterPreviewHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghs <Plug>(GitGutterStageHunk)
xmap ghs <Plug>(GitGutterStageHunk)
