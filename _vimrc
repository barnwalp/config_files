" ###################################################################
" #############################VIMRC FILE############################
" ###################################################################

""""""""""""""""""""""""""""""VIM PLUGINS""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'ayu-theme/ayu-vim'					"Ayu colorscheme plugin
Plug 'tpope/vim-fugitive'					"fugitive
Plug 'scrooloose/nerdtree'					"Nerdtree plugin
Plug 'ctrlpvim/ctrlp.vim'					"Ctrl P plugin
Plug 'tpope/vim-surround'					"surround plugin
Plug 'vim-airline/vim-airline'				"modified statusbar
Plug 'nvie/vim-flake8'						"vim-flake8
Plug 'skywind3000/asyncrun.vim'				"asynrun.vim
call plug#end()

"""""""""""""""""""""""Plugins based settings""""""""""""""""""""""
"you complete me settings

"To use youcompleteme, it need to be compiled with these 3 steps
"1. sudo apt install build-essential cmake vim python3-dev
"2. cd ~/.vim/plugged/youcompleteme
"3. python3 install.py --all

"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'

"Changing built-in colorscheme with ayu
set termguicolors		"enable true colors support
let ayucolor="dark"
colorscheme ayu

"NERDTree settings
map <C-n> :NERDTreeToggle<CR> 		"map ctrl+n to toggle nerdtree

"ctrl p searches in the directory in which vim was opened
let g:ctrlp_working_path_mode = 0

"AsynRun settings
let g:asyncrun_open = 9


"""""""""""""""""""""""""END OF VIM PLUGINS"""""""""""""""""""""""""


""""""""""""""""""""BASIC VIMRC SETTINGS - START""""""""""""""""""""

"remove yellow highlights in blank area
autocmd VimEnter * set t_ut=

" set warp as default for quickfix
augroup quickfix
	autocmd!
	autocmd FileType qf setlocal wrap
augroup END

syntax on					"Syntax highlight enabled
set number					"Show line number
set clipboard=unnamed   	"normal OS clipboard interaction
inoremap jj <Esc>			"map escape key to jj
filetype plugin on			"filetype detection on
filetype plugin indent on 	"essential for syntastic

"this will change the layout of line numbers in a way that you can use
"10j or 5k to go up or down the list
set number relativenumber
set nocompatible			"discard old vi version setting
set showmode				"Show current mode in status line

" Enable autocompletion
set wildmode=longest,list,full

"With a map leader it is possible to do extra key combinations like <leader>w
"saves the current file
let mapleader = ","

"Splits open at the bottom and right, which is non-retarded, unlike vim
set splitbelow splitright

"Key remaping for flake8
autocmd FileType python map <buffer> <leader>f :call Flake8()<CR>

"Key remaping for AsyncRun
autocmd FileType python map <buffer> <leader>r :AsyncRun py %<CR>

" Fast Saving
nmap <leader>w :w!<cr>

"Fast Exit
nmap <leader>q :q<cr>

" Always show current position
set ruler

" No annoying sound on errors
set noerrorbells
set novisualbell
set belloff=all

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

" Script to close all active windows except active window for quickfix
function! CloseAllWindowsButCurrent()
	let tabnr= tabpagenr()
	let tabinfo=gettabinfo(tabnr)
	let windows=tabinfo[0]['windows']

	for winid in windows
		let curwin=winnr() "could change
		let winnr=win_id2win(winid)
		if winnr!=curwin
			execute ':'.winnr.'q!'
		endif
	endfor
endfunction

" Shortcut for closing all inactive windows in the current tab
nmap <leader>c :call CloseAllWindowsButCurrent()<CR>

" toggle set paste in vim to ensure that pasted content are not
" improperly indented
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" copy paste in vim in wsl
" copy (write) highlighted text to .vimbuffer
vmap <C-c> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe <CR><CR>

" paste from buffer
map <C-v> :r ~/.vimbuffer<CR>
