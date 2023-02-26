
set linebreak
set tabstop=2 softtabstop=0 noexpandtab shiftwidth=2
set number
set nocompatible
syntax on

colorscheme evening
"colorscheme murphy
hi Normal ctermfg=cyan guibg=NONE ctermbg=NONE
hi LineNr ctermfg=141 ctermbg=NONE

let mapleader = ','
nmap <Leader><space> nohlsearch<cr>

nnoremap ' `
vnoremap ' `
nnoremap ; :
vnoremap ; :
nmap <CR> o<ESC>
nmap <space><space> :w<CR>

nnoremap d "_d
vnoremap d "_d

nnoremap c "_c
vnoremap c "_c

inoremap <C-x> <Esc><S-v>xi
nnoremap <C-x> <S-v>x
vnoremap <C-x> x

autocmd! bufwritepost .vimrc source %

