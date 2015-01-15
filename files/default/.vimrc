" Vundle Setup {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/vundle'

" Vundle Packages {{{
Plugin 'altercation/vim-colors-solarized'
Plugin 'ChrisKempson/Tomorrow-Theme', {'rtp': 'vim/'}
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kchmck/vim-coffee-script'
Plugin 'MarcWeber/vim-addon-mw-utils' 				" Required for vim-snipmate
Plugin 'majutsushi/tagbar'
Plugin 'mklabs/grunt.vim'
Plugin 'mileszs/ack.vim'
Plugin 'PProvost/vim-ps1'
Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'tomtom/tlib_vim'							" Required for vim-snipmate
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/bash-support.vim'
Plugin 'vim-scripts/L9'
Plugin 'vim-scripts/FuzzyFinder'

call vundle#end()            " required
filetype plugin indent on    " required

" }}}

filetype plugin indent on

" }}}

" Powerline Setup {{{
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256"
" }}}

" Global variables {{{
let g:syntastic_java_checkers=['javac']
let g:syntastic_java_javac_config_file_enabled=1
let g:syntastic_mode_map = { 'passive_filetypes': ['sass', 'scss', 'haml'] }
"let g:syntastic_scss_checkers=['sassc']
let g:erlangFoldSplitFunction=1
let g:solarized_termcolors=256
let g:BASH_AuthorName='Cody Poll'
let g:BASH_Email='CJPoll@gmail.com'
" }}} 

" Personal settings {{{
set laststatus=2   				" Always show the statusline                             
set encoding=utf-8 				" Necessary to show Unicode glyphs
set t_Co=256 					" Explicitly tell Vim that the terminal supports 256 colors

colorscheme Tomorrow-Night
set background=dark 			" Sets the background color (dark|light)
set backspace=indent,eol,start	" Backspace works correctly
set cursorline					" Highlights the current line
set fileformat=unix				" Sets the file format
set foldenable					" Enables code folding
set hlsearch					" Highlight search results
set ignorecase					" Ignore case when searching
set incsearch					" Search while typing
set nobackup					" Don't make backup files
set noswapfile					" Don't make annoying swap files
set number						" Line numbers
set ruler						" Show which column the cursor is on
set scrolloff=8					" Start scrolling when cursor is x lines from edge
set shell=/bin/zsh					" What shell to start on :shell command
"set shellcmdflag=-i	 			" Load .bash_profile when running shell commands
" (Allows aliases), but vim tends to drop to the back
set showcmd						" Shows info about the current command at the bottom
set smartcase					" Only search with case if capitals are used
set tw=80 						" Text Width = 80 characters
set wildmenu					" Autocomplete done right
set wildmode=full				" Autocomplete done right
syntax on						" Syntax highlighting

" Powershell ctags
let g:tagbar_type_ps1 = {
			\ 'ctagstype' : 'powershell',
			\ 'kinds'     : [
			\ 'f:function',
			\ 'i:filter',
			\ 'a:alias'
			\ ]
			\ }

" Change background color past 80 columns
execute "set colorcolumn=" . join(range(81,335), ',')
"set colorcolumn=80

" Tab settings

set smartindent			" Smart auto-indenting
set autoindent			" Automatically indent new lines
set tabstop=4			" How many spaces tabs are indented
set shiftwidth=4 		" How many spaces autoindent should indent 
"set expandtab 			" Turns tabs into spaces (number of spaces = tabstop)

set showbreak=↪
" }}}

" Leader settings {{{
let mapleader=","
let localleader="\\"
" }}}

" Mappings {{{

" Pinky saver
nnoremap ; :

" Git Mappings {{{
nnoremap <leader>ga :Git add 
nnoremap <leader>gs :Git status<CR>
nnoremap <leader>gc :Git commit -v<CR>
nnoremap <leader>gca :Git commit -v --amend<CR>
nnoremap <leader>gp :Git push<CR>
" }}}

" Easy alignment
nnoremap <leader>i gg=G 			

" Easy vimrc edit
nnoremap <leader>vv :vsplit $MYVIMRC<CR>
nnoremap <leader>vd :source $MYVIMRC<CR>

" Refresh FuzzyFinder File Cache
nnoremap <leader>cf :FufRenewCache<CR>

" Easy insert-mode escape
inoremap jk <ESC>
"inoremap <ESC> <nop>

" Easy remove search highlight
nnoremap <localleader>h :nohl<CR>

" Easy Save
nnoremap <leader>s :w<CR>

" Easy set relative number
nnoremap <leader>r :set relativenumber!<CR>

" Easy open tab
nnoremap <leader>t :tabnew<CR>

" Easy close tab
nnoremap <leader>o :tabclose<CR>

" Save as sudo if forgot sudo
nnoremap <leader>e :w !sudo tee %<CR>

" Easy quit override
nnoremap <leader>q :q!<CR>

" Easy quit all
nnoremap <leader><leader>q :qa!<CR>

" Easy shell command
nnoremap <leader>l :shell<CR>

" Easy window split (horizontal)
nnoremap <leader>hs :split<CR>

" Easy window split (vertical)
nnoremap <leader>vs :vsplit<CR>

" FuzzyFinder Shortcuts

" Launch file FuzzyFinder
nnoremap <leader>f :FufFile<CR>

" Launch buffer FuzzyFinder
nnoremap <leader>b :FufBuffer<CR>

" Launch dir FuzzyFinder
nnoremap <leader>d :FufDir<CR>

" Easy move to the window to the right
nnoremap <C-l> <C-w><Right>

" Easy move to the above window
nnoremap <C-k> <C-w><Up>

" Easy move to the below window 
nnoremap <C-j> <C-w><Down>

" Easy move to the window to the left
nnoremap <C-h> <C-w><Left>

" TagbarToggle
nnoremap <leader>n :TagbarToggle<CR>

" GundoToggle
nnoremap <leader>G :GundoToggle<CR>

" NerdTree toggle
nnoremap <leader>w :NERDTreeToggle<CR>

" Uppercase Letter
nnoremap <leader>U vU

" Lowercase Letter
nnoremap <leader>u vu

" Insert Erlang module name
nnoremap <leader>$ i<Right><C-R>=expand("%:t:r")<CR><ESC>

" Swap windows
nnoremap <leader><leader>s <C-w>r
" }}}

" augroups {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup erlang 
	autocmd!
	autocmd FileType erlang nnoremap <buffer> <localleader>e :!make eunit<CR>
	autocmd FileType erlang nnoremap <buffer> <localleader>r :!make test<CR>
	autocmd FileType erlang nnoremap <buffer> <localleader>d :!rm -rf doc; make docs<CR>
	autocmd FileType erlang nnoremap <buffer> <localleader>m :!make rel<CR>
	autocmd FileType erlang nnoremap <buffer> <localleader>p :!make deps<CR>
	autocmd FileType erlang nnoremap <buffer> <localleader>c :!make compile<CR>
	autocmd FileType erlang nnoremap <buffer> <localleader>t :ErlangTags<CR>
	autocmd FileType erlang nnoremap <buffer> <localleader>l :!chromium-browser ./apps/*/logs/all_runs.html<CR>
	autocmd FileType erlang nnoremap <buffer> <localleader>] lbi_<ESC>
	autocmd FileType erlang nnoremap <buffer> <localleader><localleader>] :.s/\(\<[A-Z]\)/_\1/g<CR>
	autocmd FileType erlang nnoremap <buffer> <localleader><localleader>[ :.s/_\([A-Z]\)/\1/g<CR>
augroup END

augroup python
	autocmd!
	autocmd FileType python nnoremap <buffer> <localleader>p :PROJECT<CR>
augroup END

augroup haml
	autocmd!
	autocmd FileType haml nnoremap <buffer> <localleader>rs :Rserv<CR>
	autocmd FileType haml nnoremap <buffer> <localleader>r :!rake<CR>
	autocmd FileType haml nnoremap <buffer> <localleader>m :Emodel 
	autocmd FileType haml nnoremap <buffer> <localleader>c :Econtroller  
	autocmd FileType haml nnoremap <buffer> <localleader>v :Eview 
	autocmd FileType haml nnoremap <buffer> <localleader>M ]M
	autocmd FileType haml nnoremap <buffer> <leader>m ]m
	autocmd FileType haml nnoremap <buffer> <leader><leader>m [m
	autocmd FileType haml nnoremap <buffer> <leader><leader>M [M
	au! FileType haml set noexpandtab sts=0 sw=4 ts=4
augroup END

augroup ruby 
	autocmd!
	autocmd FileType ruby nnoremap <buffer> <localleader>rs :Rserv<CR>
	autocmd FileType ruby nnoremap <buffer> <localleader>r :!rake<CR>
	autocmd FileType ruby nnoremap <buffer> <localleader>m :Emodel 
	autocmd FileType ruby nnoremap <buffer> <localleader>c :Econtroller  
	autocmd FileType ruby nnoremap <buffer> <localleader>v :Eview 
	autocmd FileType ruby nnoremap <buffer> <localleader>M ]M
	autocmd FileType ruby nnoremap <buffer> <leader>m ]m
	autocmd FileType ruby nnoremap <buffer> <leader><leader>m [m
	autocmd FileType ruby nnoremap <buffer> <leader><leader>M [M
augroup END 

augroup eruby 
	autocmd!
	autocmd FileType eruby nnoremap <buffer> <localleader>rs :Rserv<CR>
	autocmd FileType eruby nnoremap <buffer> <localleader>r :!rake<CR>
	autocmd FileType eruby nnoremap <buffer> <localleader>m :Emodel 
	autocmd FileType eruby nnoremap <buffer> <localleader>c :Econtroller  
	autocmd FileType eruby nnoremap <buffer> <localleader>v :Eview 
	autocmd FileType eruby nnoremap <buffer> <localleader>M ]M
	autocmd FileType eruby nnoremap <buffer> <leader>m ]m
	autocmd FileType eruby nnoremap <buffer> <leader><leader>m [m
	autocmd FileType eruby nnoremap <buffer> <leader><leader>M [M
augroup END 

augroup java
	autocmd!
	autocmd FileType java nnoremap <buffer> <localleader>r :!make test<CR>
augroup END

augroup reload_vimrc 
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

augroup hard
	autocmd!
	" Hard mode: No arrow keys or hjkl
	" nnoremap h			<nop>
	" nnoremap j			<nop>
	" nnoremap k			<nop>
	" nnoremap l			<nop>
	" nnoremap <Right>	<nop>
	" nnoremap <Left>		<nop>
	" nnoremap <Up>		<nop>
	" nnoremap <Down>		<nop>
augroup END
" }}}
