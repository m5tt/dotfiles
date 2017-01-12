"" Colorscheme
set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox " Important to put this last

set mouse=c

let g:python_host_prog = '/usr/bin/python2.7'

"" Leader
let mapleader = "\<Space>"

"" General preferences
syntax on
set number               	   "sets line numbers
set nowrap               	   "no line wrapping
set ttimeout				   "Timeout in between key presses
set autoread				   "Rereads file if detected it has changed elsewhere
set gdefault                   "g as default for search & replace
set ttimeoutlen=50             "Length of timeout
set complete-=i,w,b,i          "Auto complete (Ctrl-N/Ctrl-P) settings
set clipboard^=unnamedplus,unnamed
set backspace=indent,eol,start "Allow backspace over autoindent, linebreaks and start of indent
set inccommand=nosplit

"" Undo files
set undofile

""Identing
set smartindent    "autoindents after {
set shiftwidth=4   "distance for smartindent
set tabstop=4      "number of spaces for tab
set expandtab      "converts tabs to spaces


"" Search settings
set incsearch      "Incremental search - matches terms as you type
set ignorecase     "/foo will match FOO and FOo
set smartcase      "/FOO only matches FOO
set scrolloff=4    "keep 4 lines visible when scrolling

"" Filetype specific settings
""autocmd FileType html setlocal shiftwidth=2 tabstop=2

"" Tags
set tags=.tags

"" misc
map q: :q
filetype off
"set iskeyword-=_      " consider _ to be a word break


"" Mappings
nnoremap ; :
nnoremap J mzJ`z
nnoremap Q <nop>
noremap gV `[v`]
nnoremap <silent> <Leader>/ :nohlsearch<CR>
cmap w!! w !sudo tee > /dev/null %      "Save file if it wasnt opened with correct permissions
noremap Y y$ "Copy till end of line with Y

:command WQ wq
:command Wq wq
:command Wqa wqa
:command W w
:command Q q
:command QA qa
:command Qa qa

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
map gp :bp<cr>
map gc :bn<cr>
set hidden      "" Switch buffers without saving


"" Functions

"" Word processor mode
func! WordProcessor()
 setlocal textwidth=80
 setlocal smartindent
 setlocal spell spelllang=en_us
 setlocal noexpandtab
endfu

com! WP call WordProcessor()


"" Plugin config

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

"" Airline
let g:airline_powerline_fonts = 1
let g:airline_section_y=''
let g:airline_section_z=''
let g:airline_left_sep=''
let g:airline_detect_spell=0
let g:airline#extensions#whitespace#checks = []

"" TagBar
nmap <F8> :TagbarToggle<CR>


"" Plugins 
call plug#begin('~/Documents/dotfiles/neovim/.config/nvim/plugged')

"" Gruvbox
Plug 'https://github.com/morhetz/gruvbox.git'

"" Vim-Surround
Plug 'tpope/vim-surround'

"" Fugitive
Plug 'tpope/vim-fugitive'

"" CtrlP
Plug 'ctrlpvim/ctrlp.vim'

"" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"" Vim Simple Complete
Plug 'maxboisvert/vim-simple-complete'

"" Vim Autotags
Plug 'craigemery/vim-autotag'

"" Vim TagBar
Plug 'vim-scripts/Tagbar'

call plug#end()
