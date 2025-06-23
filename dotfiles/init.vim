"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath=&runtimepath
"source ~/.vimrc

lua << EOF
-- require("claude-code").setup({
--  window = {
--    split_ratio = 0.3
--  }
-- })
EOF

call plug#begin()
if has('nvim')
  set runtimepath+=~/.vim/
endif

function! SourceIfExists(file)
	let filename = glob(a:file)

	if filereadable(filename)
		execute "source " filename
	else
		echo "Couldn't source " + filename
	endif
endfunction

" Vundle Packages {{{
Plug 'bling/vim-airline'                 " Lightweight Powerline
Plug 'christoomey/vim-tmux-navigator'    " TMUX integration
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'              " Auto-pairs parens & others
Plug 'majutsushi/tagbar'                 " View ctags info in pane
Plug 'mileszs/ack.vim'                   " Ack integration
Plug 'mmorearty/elixir-ctags'
Plug 'scrooloose/nerdtree'               " Opens a file browser
Plug 'sjl/gundo.vim'                     " Lets you view your undo tree
Plug 'tmhedberg/matchit'                 " % also matches (X/HT)ML
Plug 'tpope/vim-fugitive'                " Git integration
Plug 'tpope/vim-git'                     " Git commit syntax stuff
Plug 'tpope/vim-surround'                " Auto-surround text (quotes, html, etc.)
Plug 'vim-scripts/zoomwintab.vim'        " Zooms a tab into a specific pane
Plug 'chriskempson/base16-vim'
Plug 'elixir-editors/vim-elixir'
Plug 'madox2/vim-ai'

" Claude Code Dep (and elixir-tools)
Plug 'nvim-lua/plenary.nvim'
Plug 'greggh/claude-code.nvim'
Plug 'elixir-tools/elixir-tools.nvim', { 'tag': 'stable' }

call plug#end()


lua << EOF
require('claude-code').setup({})
require("elixir").setup()
EOF

filetype plugin indent on    " required

" }}}

syntax on
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

" }}}

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
"set t_Co=256
" }}}

" Global variables {{{
let g:airline_powerline_fonts=1

let g:gundo_prefer_python3 = 1

" }}}

"Personal settings {{{
set laststatus=2   				          " Always show the statusline
set encoding=utf-8 				          " Necessary to show Unicode glyphs
set t_Co=256 					              " Explicitly tell Vim that the terminal supports 256 colors

set wildignore+=*/tmp/*,*.so,*swp,*.swo,*.zip,*.beam,*/deps/*,*/_build/*,*/node_modules/*,**/elm-stuff/*,**/doc/*,*.class,**/project/*,**/target/*

colorscheme base16-bright
"set termguicolors

let base16colorspace=256  " Access colors present in 256 colorspace"
set background=dark                 " Sets the background color (dark|light)
set backspace=indent,eol,start      " Backspace works correctly
set cursorline                      " Highlights the current line
set exrc
set fileformat=unix				          " Sets the file format
set foldenable					            " Enables code folding
set foldmethod=syntax
set foldlevel=1
set hlsearch					              " Highlight search results
set ignorecase				              " Ignore case when searching
set incsearch					              " Search while typing
"set list
"set listchars=tab:❘-,trail:·
set nobackup					              " Don't make backup files
set noswapfile				              " Don't make annoying swap files
set number						              " Line numbers
set path=$PWD/**                    " Sets the path for easier navigation
set regexpengine=1
set ruler						                " Show which column the cursor is on
set scrolloff=8				              " Start scrolling when cursor is x lines from edge
"set shell=/bin/bash		              " What shell to start on :shell command
set showcmd						              " Shows info about the current command at the bottom
set smartcase					              " Only search with case if capitals are used
set tabpagemax=30
set tw=80 						              " Text Width = 80 characters
set undofile
set undodir=/home/cjpoll/.vimundo/
set wildmenu					              " Autocomplete done right
set wildmode=full			              " Autocomplete done right
syntax on						                " Syntax highlighting

" Change background color past 80 columns
"execute "set colorcolumn=" . join(range(81,335), ',')
set colorcolumn=80

" Tab settings

set smartindent			                " Smart auto-indenting
set autoindent			                " Automatically indent new lines
set tabstop=2			                  " How many spaces tabs are indented
set shiftwidth=2 		                " How many spaces autoindent should indent
set expandtab 			                " Turns tabs into spaces (number of spaces == tabstop)

"set showbreak=↪
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

" Toggle paste mode
nnoremap <leader>p :set paste!<CR>

" Claude!
nnoremap <leader>c :ClaudeCode<CR>

" Easy alignment
nnoremap <leader>i gg=G

" Easy vimrc edit
nnoremap <leader>vv :vsplit $MYVIMRC<CR>
nnoremap <leader>vd :source $MYVIMRC<CR>

" Zoom tab into window
nnoremap <leader>zi :ZoomWinTabIn<CR>
nnoremap <leader>zo :ZoomWinTabOut<CR>

" Easy insert-mode escape
inoremap jk <ESC>
inoremap <ESC> <nop>

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

" Easy window split (horizontal)
nnoremap <leader>hs :split<CR>

" Easy window split (vertical)
nnoremap <leader>vs :vsplit<CR>

" Horizontal split to vsplit
nnoremap <leader>x <C-w>t<C-w>H

" Vertical split to Horizontal split
nnoremap <leader>z <C-w>t<C-w>K

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
nnoremap <leader><leader>n <C-w>5l

" GundoToggle
nnoremap <leader>G :GundoToggle<CR>

" NerdTree toggle
nnoremap <leader>w :NERDTreeToggle<CR>

" Uppercase Letter
nnoremap <leader>U vU

" Lowercase Letter
nnoremap <leader>u vu

" Swap windows
nnoremap <leader><leader>s <C-w>r
" }}}

" augroups {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup reload_vimrc
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

augroup css
	autocmd!
	autocmd! FileType css set ts=4
	autocmd! FileType css set sw=4
augroup END

augroup gitcommit
	autocmd!
	autocmd! FileType gitcommit set textwidth=72  " Git commits should be 72 lines
augroup END
" }}}
set exrc
set secure

call SourceIfExists("$HOME/.vimrc.local")
