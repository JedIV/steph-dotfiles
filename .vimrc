" ╔═══════════════════════════════════════════════════════════════╗
" ║  Steph's Vim Config                                           ║
" ║  Pretty and practical                                         ║
" ╚═══════════════════════════════════════════════════════════════╝

" ─────────────────────────────────────────────────────────────────
" Basics
" ─────────────────────────────────────────────────────────────────
filetype plugin indent on
syntax on
set number                  " Line numbers
set relativenumber          " Relative line numbers (nice for jumping)
set nowrap                  " Don't wrap lines
set cursorline              " Highlight current line
set showmatch               " Show matching brackets
set scrolloff=8             " Keep 8 lines visible above/below cursor
set signcolumn=yes          " Always show sign column

" ─────────────────────────────────────────────────────────────────
" Indentation
" ─────────────────────────────────────────────────────────────────
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab               " Spaces instead of tabs

" ─────────────────────────────────────────────────────────────────
" Search
" ─────────────────────────────────────────────────────────────────
set ignorecase              " Case insensitive search
set smartcase               " Unless you use capitals
set incsearch               " Search as you type
set hlsearch                " Highlight matches

" ─────────────────────────────────────────────────────────────────
" Quality of Life
" ─────────────────────────────────────────────────────────────────
set clipboard=unnamed       " Use system clipboard
set mouse=a                 " Enable mouse
set splitright              " New vertical splits go right
set splitbelow              " New horizontal splits go below
set wildmenu                " Better command completion
set wildmode=longest:full,full

" ─────────────────────────────────────────────────────────────────
" Key Mappings
" ─────────────────────────────────────────────────────────────────
let mapleader = " "

" Quick escape
imap jk <Esc>

" Clear search highlighting
nnoremap <leader><space> :nohlsearch<CR>

" Quick save
nnoremap <leader>w :w<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ─────────────────────────────────────────────────────────────────
" Plugin Manager (vim-plug, auto-installs)
" ─────────────────────────────────────────────────────────────────
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Color scheme - Solarized
Plug 'altercation/vim-colors-solarized'

" File explorer
Plug 'scrooloose/nerdtree'

" Status line
Plug 'itchyny/lightline.vim'

" Git indicators in gutter
Plug 'airblade/vim-gitgutter'

" Better syntax highlighting
Plug 'sheerun/vim-polyglot'

call plug#end()

" ─────────────────────────────────────────────────────────────────
" Colorscheme (Solarized Light)
" ─────────────────────────────────────────────────────────────────
set termguicolors
set background=light
let g:solarized_termcolors=256

" Apply colorscheme (silently fail if not installed yet)
silent! colorscheme solarized

" Lightline theme
let g:lightline = {'colorscheme': 'solarized'}

" Always show status line
set laststatus=2
set noshowmode              " Lightline shows the mode

" ─────────────────────────────────────────────────────────────────
" NERDTree
" ─────────────────────────────────────────────────────────────────
nnoremap \ :NERDTreeToggle<CR>
nnoremap \| :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$', '\.swp$', '\.DS_Store']
let NERDTreeShowHidden = 1

" Close vim if NERDTree is the only window left
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
