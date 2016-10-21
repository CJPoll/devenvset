" Vundle Setup {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/vundle'

" Vundle Packages {{{
Plugin 'altercation/vim-colors-solarized'             " Second best theme. Good in light.
"Plugin 'bling/vim-airline'                            " Lightweight Powerline
Plugin 'chriskempson/base16-vim'
Plugin 'christoomey/vim-tmux-navigator'               " TMUX integration
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'fatih/vim-go'
"Plugin 'garbas/vim-snipmate'                          " Saves tons of typing. Google it.
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'                           " Premade snippets
Plugin 'jelera/vim-javascript-syntax'                 " Fixes javascript syntax
Plugin 'jiangmiao/auto-pairs'                         " Auto-pairs parens & others
Plugin 'kchmck/vim-coffee-script'                     " CoffeeScript Syntax
Plugin 'majutsushi/tagbar'                            " View ctags info in pane
Plugin 'mileszs/ack.vim'                              " Ack integration
Plugin 'mmorearty/elixir-ctags'
Plugin 'nathanaelkane/vim-indent-guides'              " Fixes JS indent error
Plugin 'pangloss/vim-javascript'                      " A JS plugin recommended on net
Plugin 'rdnetto/YCM-Generator'                        " Required for YCM
Plugin 'scrooloose/nerdtree'                          " Opens a file browser
Plugin 'scrooloose/syntastic'                         " Syntax checker
"Plugin 'slashmili/alchemist.vim'
Plugin 'sjl/gundo.vim'                                " Lets you view your undo tree
Plugin 'tmhedberg/matchit'                            " % also matches (X/HT)ML
Plugin 'tpope/vim-fugitive'                           " Git integration
Plugin 'tpope/vim-git'                                " Git commit syntax stuff
Plugin 'tpope/vim-rails'                              " Makes deving on rails easier
Plugin 'vim-ruby/vim-ruby'                            " Some ruby nav stuff
Plugin 'tpope/vim-surround'                           " Auto-surround text (quotes, html, etc.)
Plugin 'Valloric/YouCompleteMe'                      " Auto-complete. Requires compile.
Plugin 'vim-scripts/zoomwintab.vim'                   " Zooms a tab into a specific pane
Plugin 'vim-scripts/L9'                               " Required for FuzzyFinder
Plugin 'vim-scripts/FuzzyFinder'                      " Great file/buffer navigation
Plugin 'Yggdroot/indentLine'

Plugin 'ctags.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" }}}

syntax on
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

" }}}

" Powerline Setup {{{
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256"
" }}}

" Global variables {{{
let g:airline_powerline_fonts = 1
let g:solarized_termcolors=256
let g:BASH_AuthorName='Cody Poll'
let g:BASH_Email='CJPoll@gmail.com'
let g:erlangFoldSplitFunction=1
let g:syntastic_mode_map = { 'passive_filetypes': ['sass', 'scss', 'haml', 'ruby'] }
let base16colorspace=256

" Syntastic Settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1

" Syntastic checkers
"let g:syntastic_scss_checkers=['sassc']
"let g:syntastic_c_checkers = ['gcc']
let g:syntastic_coffee_checkers = []
"let g:syntastic_css_checkers = ['csslint', 'prettycss']
"let g:syntastic_eruby_checkers = ['ruby']
"let g:syntastic_handlebars_checkers = ['handlebars']
"let g:syntastic_html_checkers = ['jshint', 'tidy', 'w3', 'validator']
let g:syntastic_java_checkers = []
let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_json_checkers = ['jsonlint', 'jsonval']
let g:syntastic_jsx_checkers = ['eslint']
let g:syntastic_ruby_checkers = [] "['rubocop']
"let g:syntastic_sh_checkers = ['bashate', 'sh', 'shellcheck']
" }}}

"Personal settings {{{
set laststatus=2   				          " Always show the statusline
set encoding=utf-8 				          " Necessary to show Unicode glyphs
set t_Co=256 					              " Explicitly tell Vim that the terminal supports 256 colors

colorscheme base16-bright
set background=dark 			          " Sets the background color (dark|light)
set backspace=indent,eol,start		  " Backspace works correctly
set cursorline					            " Highlights the current line
set exrc
set fileformat=unix				          " Sets the file format
set foldenable					            " Enables code folding
set foldmethod=syntax
set foldlevel=1
set hlsearch					              " Highlight search results
set ignorecase				              " Ignore case when searching
set incsearch					              " Search while typing
"set list listchars=tab:❘-,trail:·
set nobackup					              " Don't make backup files
"set noswapfile				              " Don't make annoying swap files
set number						              " Line numbers
set path=$PWD/**                    " Sets the path for easier navigation
set re=1
set ruler						                " Show which column the cursor is on
set scrolloff=8				              " Start scrolling when cursor is x lines from edge
set shell=/bin/zsh		              " What shell to start on :shell command
"set shellcmdflag=-i	              " Load .bash_profile when running shell commands
" (Allows aliases), but vim tends to drop to the back
set showcmd						              " Shows info about the current command at the bottom
set smartcase					              " Only search with case if capitals are used
set tw=80 						              " Text Width = 80 characters
set wildmenu					              " Autocomplete done right
set wildmode=full			              " Autocomplete done right
syntax on						                " Syntax highlighting

" Change background color past 80 columns
"execute "set colorcolumn=" . join(range(81,335), ',')
set colorcolumn=80

" Tab settings

set smartindent			                " Smart auto-indenting
set autoindent			                " Automatically indent new lines
set tabstop=4			                  " How many spaces tabs are indented
set shiftwidth=4 		                " How many spaces autoindent should indent
set noexpandtab 			                " Turns tabs into spaces (number of spaces == tabstop)

set showbreak=↪
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
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

" Zoom tab into window
nnoremap <leader>zi :ZoomWinTabIn<CR>
nnoremap <leader>zo :ZoomWinTabOut<CR>

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

" Horizontal split to vsplit
nnoremap <leader>x <C-w>t<C-w>H

" Vertical split to Horizontal split
nnoremap <leader>z <C-w>t<C-w>K

" FuzzyFinder Shortcuts

" Launch file FuzzyFinder
nnoremap <leader>f :FufFile<CR>

" Launch buffer FuzzyFinder
nnoremap <leader>b :FufBuffer<CR>

" Launch dir FuzzyFinder
nnoremap <leader>d :FufDir<CR>

" Easy move to the window to the right
nnoremap <C-l> <C-w>l

" Easy move to the above window
nnoremap <C-k> <C-w>k

" Easy move to the below window
nnoremap <C-j> <C-w>j

if has('nvim')
	nmap <BS> <C-W>h
	tnoremap <Esc> <C-\><C-n>
endif
" Easy move to the window to the left
nnoremap <C-h> <C-w>h

" TagbarToggle
nnoremap <leader>n :TagbarToggle<CR>

" Jump to tagbar
nnoremap <leader><leader>n <C-w>2l

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
augroup go
  autocmd!
  autocmd! FileType go nnoremap <localleader>r :GoRun<CR>
	autocmd! FileType ruby set smartindent
	autocmd! FileType ruby set autoindent
	autocmd! FileType ruby set tabstop=4
	autocmd! FileType ruby set shiftwidth=4
	autocmd! FileType ruby set noexpandtab
augroup END

augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup reload_vimrc
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

augroup ruby
	autocmd!
	autocmd! FileType ruby set smartindent
	autocmd! FileType ruby set autoindent
	autocmd! FileType ruby set tabstop=2
	autocmd! FileType ruby set shiftwidth=2
	autocmd! FileType ruby set expandtab
augroup END

augroup jsx
	autocmd!
	autocmd FileType jsx setf javascript
augroup END

au BufNewFile,BufRead *.es6 setlocal ft=javascript

augroup javascript
	autocmd!
	autocmd FileType javascript call JavaScriptFold()
	autocmd! FileType javascript set smartindent			                " Smart auto-indenting
	autocmd! FileType javascript set autoindent			                " Automatically indent new lines
	autocmd! FileType javascript set tabstop=4			                  " How many spaces tabs are indented
	autocmd! FileType javascript set shiftwidth=4 		                " How many spaces autoindent should indent
	autocmd! FileType javascript set noexpandtab 			                " Turns tabs into spaces (number of spaces == tabstop)
augroup END

augroup yaml
	autocmd!
	autocmd! FileType yaml setlocal smartindent			                " Smart auto-indenting
	autocmd! FileType yaml setlocal autoindent			                " Automatically indent new lines
	autocmd! FileType yaml setlocal tabstop=2			                  " How many spaces tabs are indented
	autocmd! FileType yaml setlocal shiftwidth=2 		                " How many spaces autoindent should indent
	autocmd! FileType yaml setlocal expandtab 			                " Turns tabs into spaces (number of spaces == tabstop)
augroup END

augroup gitcommit
  autocmd!
  autocmd! FileType gitcommit set textwidth=72  " Git commits should be 72 lines
augroup END
" }}}
set exrc
set secure

let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records'
        \ ]
      \ }
