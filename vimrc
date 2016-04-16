"" Colorscheme
set t_Co=256
set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox " Important to put this last

"" Leader
let mapleader=","

"" General preferences
syntax enable
set clipboard=autoselect	   "let vim use the system clipboard
set clipboard=unnamedplus
set title                	   "set discriptive window title
set number               	   "sets line numbers
set encoding=utf-8       	   "sets encoding to UTF-8
set nowrap               	   "lines will not start over in newline when it gets to long
set backspace=indent,eol,start "Allow backspace over autoindent, linebreaks and start of indent
set ttimeout				   "Timeout in between key presses
set ttimeoutlen=50             "Length of timeout
set autoread				   "Rereads file if detected it has changed elsewhere

""Identing
set autoindent     "keep indent
set smartindent    "autoindents after {
set shiftwidth=4   "distance for smartindent
set tabstop=4      "number of spaces for tab
set expandtab      "converts tabs to spaces

"" Search settings
set incsearch      "Incremental search - matches terms as you type
set ignorecase     "/foo will match FOO and FOo
set smartcase      "/FOO only matches FOO
set scrolloff=4    "keep 4 lines visible when scrolling

"" Auto complete (Ctrl-N/Ctrl-P) settings
set complete-=i,w,b,i

"" Buffers
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>
set hidden      "" Switch buffers without saving

"" Fix pasting from terminal
set pastetoggle=<F2>
set showmode

"" Windows
set splitright
set splitbelow


"" Plugins with Vim-Plug
call plug#begin('~/.vim/plugged')

"" Gruvbox
Plug 'morhetz/gruvbox'

"" Vim-Surround
Plug 'tpope/vim-surround'

Plug 'tpope/vim-fugitive'

call plug#end()
