
" avoid c mappings overriding the cpp ones, 
" since cpp.vim loads this file by default
if (&ft != 'c')
    finish
endif

setlocal tabstop=4 softtabstop=0 noexpandtab shiftwidth=4
imap <F5> <Esc>:w<CR>:!gcc % -o %<.out && ./%<.out<CR>
noremap <F5> <Esc>:w<CR>:!gcc % -o %<.out && ./%<.out<CR>
imap <Leader>r <Esc>:w<CR>:!gcc % -o %<.out && ./%<.out<CR>
noremap <Leader>r <Esc>:w<CR>:!gcc % -o %<.out && ./%<.out<CR>

