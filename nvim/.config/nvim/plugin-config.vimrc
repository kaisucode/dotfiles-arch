
" let g:gitgutter_diff_base = '<commit SHA>'
nmap <Leader>g :let g:gitgutter_diff_base = ''

"-------------Plugins--------------"
"
"/
"/ vim-substitution
"/
" let g:substitution_fullwordmatch = 1
" let g:substitution_global = 1
" let g:substitution_confirmation = 0

"/
"/ NERDTree
"/
" Key binding for NERDTreeToggle
function! MyNerdToggle()
	if &filetype == 'nerdtree'
		:NERDTreeToggle 
	else
		:NERDTreeFind
	endif
endfunction
nnoremap <Leader><tab> :call MyNerdToggle()<CR>
set encoding=utf8
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1		"Show hidden files
let NERDTreeQuitOnOpen=1			"Close NERDTree if a file is opened

"Ignoring files
let NERDTreeIgnore=['node_modules$[[dir]]', '__pycache__$[[dir]]', '.git$[[dir]]', '.exe', '.pyc', '.class', '.zip', '.netrwhist']

" Open a NERDTree automatically when vim starts up if no files were specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" After a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
	call webdevicons#refresh()
endif

" Disable netrw and replace it with nerdtree
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1



"/
"/ lightline
"/
set noshowmode								"Remove ---insert--- below status bar

let g:lightline = {
	  \ 'colorscheme': 'Dracula',
	  \ 'active': {
	  \   'left': [ [ 'mode', 'paste' ],
	  \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'curfunction' ] ]
	  \ },
	  \ 'component_function': {
		\		'curfunction': 'MyCurfunction',
	  \   'filename': 'MyFilename',  
	  \   'gitbranch': 'gitbranch#name', 
	  \   'filetype': 'MyFiletype', 
	  \   'fileformat': 'NONE', 
	  \   'fileencoding': 'NONE', 
	  \ },
	  \ }


"/ tag helper plugin!
function! MyCurfunction()
	return taghelper#curtag()
endfunction

function! MyFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFilename()
	return expand('%')
endfunction


"/
"/ lightline-bufferline
"/

let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline.tabline          = {'left': [['buffers']], 'right': []}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline#bufferline#filename_modifier = ':t'				" Only show filename (no path)
" let g:lightline#bufferline#filename_modifier = ':h'				" Only show upper dir
let g:lightline#bufferline#enable_devicons = 1


nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)


"/
"/ UltiSnips
"/
let g:UltiSnipsExpandTrigger = '<C-j>'
"let g:UltiSnipsExpandTrigger = '<Enter>'

"/
"/ vim-gitgutter
"/
set updatetime=250


"/
"/ auto-pairs (complete brackets, quotes, and paranthesis)
"/
let g:AutoPairsMultilineClose = 0

"/
"/ nerdcommenter
"/
let g:NERDSpaceDelims = 1					" Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1				" Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'				" Align line-wise comment delimiters flush left instead of following code indentation
" Ctrl-/ to comment (vim registers _ instead of /)
imap <C-_> <C-o><leader>c<Space>
nmap <C-_> <leader>c<Space>
vmap <C-_> <leader>c<Space>
let g:NERDAltDelims_eruby = 1




"/
"/ vim-move
"/
" Set custom modifier (Currently is bind to ALT)
" let g:move_key_modifier = 'C'


" MacOS
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==

inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi

vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv


"/
"/ Rainbow Parentheses
"/
" Changes colors of parantheses
" augroup rainbow
"   autocmd!
"   autocmd FileType c,java,cpp RainbowParentheses
" augroup END


"/
"/ vim-surround
"/
" Documentation
" https://github.com/tpope/vim-surround
" https://stackoverflow.com/a/25555008


"/
"/ deoplete
"/ 
let g:deoplete#enable_at_startup = 1

" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"


"/
"/ fzf
"/ 
nnoremap <Leader><space> :FZF<CR>
" let g:fzf_preview_window = 'right:40%'


"/
"/ dracula
"/
" colorscheme dracula
" hi Normal ctermbg=NONE	
" hi Visual ctermfg=LightYellow ctermbg=black
" hi LineNr ctermfg=141 ctermbg=NONE
" hi SignColumn ctermbg=NONE


"/
"/ vim-startify
"/ 
" let g:startify_custom_indices = ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l']
" let g:startify_custom_header = [] 
" let g:startify_session_sort = 1
" let g:startify_files_number = 5
" let g:startify_session_persistence = 1

" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
" function! s:gitModified()
"     let files = systemlist('git ls-files -m 2>/dev/null')
"     return map(files, "{'line': v:val, 'path': v:val}")
" endfunction

" same as above, but show untracked files, honouring .gitignore
" function! s:gitUntracked()
"     let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
"     return map(files, "{'line': v:val, 'path': v:val}")
"   endfunction
" let g:startify_lists = [
"       \ { 'type': 'sessions',  'header': ['   Saved sessions'] },
"       \ { 'type': 'dir',       'header': ['   Recent files (cwd)'] },
"       \ { 'type': 'files',     'header': ['   Recent files (Global)']            },
"       \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
"       \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
"       \ ]


"/
"/ emmet-vim
"/ 
let g:user_emmet_leader_key=','


"/
"/ vim-markdown
"/
let g:markdown_enable_conceal = 1
let g:markdown_enable_spell_checking = 0


"/
"/ vim-vue
"/
let g:vue_disable_pre_processors=1

let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

"/
"/ vim-alternate
"/
nnoremap <Leader>h :Alternate<CR>

"/
"/ ack.vim
"/
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack<Space>


"/
"/ vindent.vim
"/
let g:vindent_motion_OO_prev   = '[=' " jump to prev block of same indent.
let g:vindent_motion_OO_next   = ']=' " jump to next block of same indent.
let g:vindent_motion_more_prev = '[+' " jump to prev line with more indent.
let g:vindent_motion_more_next = ']+' " jump to next line with more indent.
let g:vindent_motion_less_prev = '[-' " jump to prev line with less indent.
let g:vindent_motion_less_next = ']-' " jump to next line with less indent.
let g:vindent_motion_diff_prev = '[;' " jump to prev line with different indent.
let g:vindent_motion_diff_next = '];' " jump to next line with different indent.
let g:vindent_motion_XX_ss     = '[p' " jump to start of the current block scope.
let g:vindent_motion_XX_se     = ']p' " jump to end   of the current block scope.
let g:vindent_object_XX_ii     = 'ii' " select current block.
let g:vindent_object_XX_ai     = 'ai' " select current block + one extra line  at beginning.
let g:vindent_object_XX_aI     = 'aI' " select current block + two extra lines at beginning and end.

"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.

autocmd! bufwritepost plugin-config.vimrc source $HOME/.config/nvim/init.vim

