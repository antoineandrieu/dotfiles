" Windows navigation
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <S-t> :tabedit<Space>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Reload current file with F5
nnoremap <F5> :edit!<CR>

" Source current file with double F5
nnoremap <F5><F5> :source %<CR>
