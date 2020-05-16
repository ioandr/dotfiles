set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required

" Plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'KevinGoodsell/vim-csexact'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
Plugin 'plasticboy/vim-markdown'
Plugin 'mhartington/oceanic-next'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'w0rp/ale'

" Add CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Configure CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

" Enable folding
 set foldmethod=indent
 set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Show docstring for folded
let g:SimpylFold_docstring_preview=1

" Set tabs and indent for Python
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Set tabs for JS,HTML,CSS
au BufNewFile,BufRead *.js,*.jsonnet,*.libsonnet,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" Indicate needless whitespaces
autocmd BufEnter * highlight BadWhitespace ctermbg=160 guibg=#d70000
autocmd BufEnter * match BadWhitespace /\s\+$/

" Remove trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

let g:ycm_autoclose_preview_window_after_completion=1
let python_highlight_all=1

" Load navigation Tree
" autocmd VimEnter * NERDTree | wincmd p

" Set spelling languages
set spelllang=en_us,el

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" General configuration
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set number          " show line numbers
set showcmd         " show command in bottom bar
set cursorline     " highlight current line
filetype indent on  " load filetype-specific indent files
set showmatch       " highlight matching [{()}]
set incsearch       " search as characters are entered
set hlsearch        " highlight matches
set mouse=a			" enable mouse clicks
syntax enable		" enable syntax
set background=dark

if (has("termguicolors"))
  set termguicolors
endif

set t_Co=256

" Airline setup
let g:airline_powerline_fonts = 1
"let g:airline_theme='molokai'

"let g:airline_theme='solarized'
"let g:airline_solarized_bg='dark'
let g:airline_theme='oceanicnext'

let g:solarized_termcolors=256
let g:molokai_original=1
let g:gruvbox_contrast_dark='hard'
let g:oceanic_next_terminal_bold = 1

" Save privileged files opened in RO mode
cnoremap sudow w !sudo tee % >/dev/null

"colorscheme zenburn
"colorscheme solarized
"colorscheme codeschool
"colorscheme molokai
"colorscheme gruvbox
"colorscheme one-dark-256
colorscheme OceanicNext

" Set specific line width and spelling on git commit and mail files
autocmd Filetype gitcommit,mail setlocal tw=72
autocmd Filetype gitcommit,mail setlocal spell
autocmd Filetype rst setlocal tw=80
autocmd FileType gitcommit,mail setlocal colorcolumn=73

" Highlight strace
autocmd BufRead,BufNewFile *.strace set filetype=strace
