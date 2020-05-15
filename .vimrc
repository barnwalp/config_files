""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""VIMRC FILE"""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""VIM PLUGINS"""""""""""""""""""""""""""""

"""""""""""""""""""""""""END OF VIM PLUGINS"""""""""""""""""""""""""


"""""""""""""""""""""""""BASIC VIMRC SETTINGS"""""""""""""""""""""""

syntax on					"Syntax highlight enabled
set number					"Show line number
set clipboard=unnamed   	"normal OS clipboard interaction
inoremap jj <Esc>			"map escape key to jj
filetype plugin on			"filetype detection on
"this will change the layout of line numbers in a way that you can use
"10j or 5k to go up or down the list
set number relativenumber

set showmode				"Show current mode in status line
"Changing built-in colorscheme
colorscheme pablo
set background=dark

" Enable autocompletion
set wildmode=longest,list,full

"With a map leader it is possible to do extra key combinations like <leader>w
"saves the current file
let mapleader = " "

"Splits open at the bottom and right, which is non-retarded, unlike vim
set splitbelow splitright

" Fast Saving
nmap <leader>w :w!<cr>

" Always show current position
set ruler

" No annoying sound on errors
set noerrorbells
set novisualbell

" automatically deletes all trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

" 1 tab = 4 spaces
set shiftwidth=4
set tabstop=4

" Turn backup off, since most stuff is in git anyway
set nobackup
set nowb
set noswapfile

" Better way to move between split windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Disable search highlight when <leader><cr> is pressed
map  <silent> <leader><cr> :noh<cr>

"  Status Line
set laststatus=2
set cmdheight=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Indenting
set ai
set si
set nowrap

" Search cofiguration
set ignorecase			"Ignore case when searching
set smartcase

"Type :noh to turn off temporarily
set hlsearch			"Highlight search results
set incsearch			"Make search act like search in browsers

" Helper functions
" Returns true if paste mode is enabled

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction
