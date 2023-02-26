

" Temporary handicap
" noremap <Up> <Nop>
" noremap <Down> <Nop>
" noremap <Left> <Nop>
" noremap <Right> <Nop>
"


" Yank and copy to clipboard with filename and line numbers
" vnoremap <Leader>z :<C-U>echom CompleteYank()<cr>
" function! CompleteYank()
"   redir @n | silent! :'<,'>number | redir END
"   let filename=expand("%")
"   let decoration=repeat('-', len(filename)+1)
"   let @*=decoration . "\n" . filename . ':' . "\n" . decoration . "\n" . @n
" endfunction


" nnoremap J <PageDown>
" nnoremap K <PageUp>


" join two lines
" nnoremap Q gJ


set linebreak

"------------Indentation--------------"
" Default
set tabstop=2 softtabstop=0 noexpandtab shiftwidth=2

set cindent
set cinkeys-=0X^H#
set indentkeys-=0X^H#

filetype plugin indent on

" nnoremap p ]p
"Format pasted text automatically

syntax on


"------------Mappings--------------"
let mapleader = ','		"The default leader is '\', but ',' is better.

nnoremap ' `
vnoremap ' `
nnoremap ; :
vnoremap ; :
" inoremap jf <esc>
" vnoremap jf <esc>
" noremap <leader>q :q<cr>

nmap <CR> o<ESC>
nmap <space><space> :w<CR>

inoremap cz <Esc>uI
"Go to normal mode, undo, and go back to insert

" nnoremap d "_d
" vnoremap d "_d
" nnoremap c "_c
" vnoremap c "_c
nnoremap s "_s
vnoremap s "_s

inoremap <C-x> <Esc><S-v>xi
nnoremap <C-x> <S-v>x
vnoremap <C-x> x

"Select all (if need to copy to clipboard, change to gg"+yG)
map VV <Esc>ggVG<CR>


" macOS
vnoremap ç "+yi<Esc>	
vnoremap <A-c> "+yi<Esc>
" vnoremap <F9> "+yi<Esc>


set number			"Activate line numbers.
let g:LineNumbers = 1
nmap <F7> :echom ToggleNums()<CR>
function! ToggleNums()
	let temp = g:LineNumbers
	if temp == 1
		set nonumber
		let g:LineNumbers = 0
	else
		set number
		let g:LineNumbers = 1
	endif
	" execute "set showtabline=".newTabStatus
endfunction

" Wrap word in paranthesis
nmap <F8> b"qcw(<esc>"qp


"-------------Color schemes--------------"
"colorscheme blue"
" set background=dark
" hi Normal guibg=NONE ctermbg=NONE	
"Transparent background, no matter the color scheme"

colorscheme evening
" colorscheme deus_ex

hi Normal ctermbg=NONE	
hi Visual ctermfg=LightYellow ctermbg=black
hi LineNr ctermfg=141 ctermbg=NONE
hi SignColumn ctermbg=NONE
hi Comment cterm=italic
" SignColumn is the gitgutter panel

"-------------Split management--------------"
set splitbelow
set splitright

nmap <C-H> <C-W><C-H>
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>

"-------------Search--------------"
set hlsearch
set incsearch
set showmatch
set ignorecase		" Make searching case insensitive
set smartcase		" ... unless the query has capital letters.


"Add highlight removal"
nmap <Leader>n :nohlsearch<cr>

" Substitution
nmap <Leader>s :%s//

" Highlight all occurences of entire word
" nmap haw yaw/<C-r>"<CR>

" Replace all occurences of entire word
" nmap raw yaw/<C-r>"<CR>:%s//

"-------------Tabs--------------"
" nmap <C-W> :tabclose<cr>
" nmap <C-T> :tabe<cr>

set showtabline=2
nmap <C-T> :echom SwapTab()<cr>
function! SwapTab()
	let TabStatus = &showtabline
	let newTabStatus = abs(TabStatus-2)
	execute "set showtabline=".newTabStatus
endfunction
" 0: never
" 1: only if there are at least two tab pages
" 2: always

"-------------Buffers--------------"

" Open new empty tab
nmap <Leader>t :enew<bar>:Startify<cr>

" Move to the next buffer
nmap <leader>f :bnext<CR>
nmap f<leader> :bnext<CR>

" Move to the previous buffer
nmap <leader>d :bprevious<CR>
nmap d<leader> :bprevious<CR>

" Close the current buffer and move to the previous one
nmap <leader>w :bp <BAR> bd #<CR>
nmap w<leader> :bp <BAR> bd #<CR>

" Be able to switch buffers without saving
set hidden


" Plugins will not rely on virtualenv python libraries
" let g:python3_host_prog = '/usr/bin/python3'
" let g:python3_host_prog = '/usr/local/bin/python3'
" let g:python3_host_prog = '/Applications/Xcode.app/Contents/Developer/usr/bin/python3'

" no this is not a typo; deoplete insists on this format
" Make a virtual environment in the vim config directory to make your life easier
let g:python3_host_prog = $HOME.'/.config/nvim/env/bin/python3'

"Automatically source the Vimrc file on save.
autocmd! bufwritepost general.vim source $HOME/.config/nvim/init.vim

