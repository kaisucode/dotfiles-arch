
call plug#begin()
	Plug 'mgedmin/taghelper.vim'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	Plug 'mgee/lightline-bufferline'
	Plug 'itchyny/lightline.vim', {'commit': '78c43c1'}
	Plug 'itchyny/vim-gitbranch'
	Plug 'airblade/vim-rooter'
	Plug 'airblade/vim-gitgutter'
	Plug 'preservim/nerdcommenter'
	Plug 'preservim/nerdtree'
	Plug 'junegunn/goyo.vim'
	Plug 'junegunn/rainbow_parentheses.vim'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'kaisucode/ack.vim'
	Plug 'ryanoasis/vim-devicons'
	" Plug 'matze/vim-move'
	" Plug 'kaisucode/vim-substitution'
	Plug 'dracula/vim', { 'as': 'dracula' }
	Plug 'jiangmiao/auto-pairs'
	" Plug 'mhinz/vim-startify'
	Plug 'dhruvasagar/vim-table-mode'
	Plug 'pbrisbin/vim-mkdir'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-endwise'
	Plug 'tpope/vim-rails'
	Plug 'vim-ruby/vim-ruby'
	Plug 'ap/vim-css-color'
	Plug 'yuezk/vim-js'
	Plug 'posva/vim-vue'
	Plug 'maxmellon/vim-jsx-pretty'
	Plug 'leafgarland/typescript-vim'
	Plug 'peitalin/vim-jsx-typescript'
	Plug 'wlangstroth/vim-racket'
	Plug 'gabrielelana/vim-markdown'
	Plug 'chmp/mdnav'
	" Plug 'calviken/vim-gdscript3'
	Plug 'sbdchd/neoformat'
	Plug 'mattn/emmet-vim'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	" Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'ton/vim-alternate'
	" Plug 'jessekelighine/vindent.vim', {'branch': 'main'}
call plug#end()



"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.
autocmd! bufwritepost vimPlug.vimrc source $HOME/.config/nvim/init.vim

