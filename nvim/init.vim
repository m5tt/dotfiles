"" Colorscheme
set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox " Important to put this last

"" Leader
let mapleader = "\<Space>"

"" General preferences
syntax enable
set clipboard=unnamedplus
set title                	   "set discriptive window title
set number               	   "sets line numbers
set encoding=utf-8       	   "sets encoding to UTF-8
set nowrap               	   "no line wrapping
set backspace=indent,eol,start "Allow backspace over autoindent, linebreaks and start of indent
set ttimeout				   "Timeout in between key presses
set ttimeoutlen=50             "Length of timeout
set autoread				   "Rereads file if detected it has changed elsewhere
"set laststatus=1               "Fix neovim weird statusline
set gdefault                   "g as default for search & replace

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

"" Shortcuts
nnoremap ; :

"" Auto complete (Ctrl-N/Ctrl-P) settings
set complete-=i,w,b,i

"" Splits
set splitright
set splitbelow

"" Navigation
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>

"" Resize
nnoremap <silent> + :exe "resize " . (winheight(0) + 5)<CR>
nnoremap <silent> _ :exe "resize " . (winheight(0) - 5)<CR>
nnoremap <silent> > :exe "vertical resize " . (winwidth(0) + 2)<CR>
nnoremap <silent> < :exe "vertical resize " . (winwidth(0) - 2)<CR>

"" Buffers
map gn :bn<cr>
map gp :bn<cr>
map gc :bn<cr>
set hidden      "" Switch buffers without saving

"" Word processor mode
func! WordProcessor()
 setlocal textwidth=20
 setlocal smartindent
 setlocal spell spelllang=en_us
 setlocal noexpandtab
endfu

com! WP call WordProcessor()

"" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <Leader>o :CtrlP<CR>

"" Use nearest .git as current working dir
let g:ctrlp_working_path_mode = 'r'

"" Ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg|pdf)$',
\}


"" Unfourtunately neccesary
map q: :q

"" Plugins with Vim-Plug
call plug#begin('~/.vim/plugged')

"" Gruvbox
Plug 'morhetz/gruvbox'

"" Vim-Surround
Plug 'tpope/vim-surround'

"" Fugitive
Plug 'tpope/vim-fugitive'

"" CtrlP
Plug 'ctrlpvim/ctrlp.vim'

"" Neomake
Plug 'benekastah/neomake'

"Plug 'Valloric/YouCompleteMe'

call plug#end()
