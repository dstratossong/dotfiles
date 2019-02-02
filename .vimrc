set encoding=utf-8
set t_Co=256

" Vim-Plug
call plug#begin('~/.vim/plugged')

" Basic agreeable settings
Plug 'tpope/vim-sensible'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
let g:airline#extensions#branch#enabled = 1

" Fugitive
Plug 'tpope/vim-fugitive'

" Autocompletion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }

" Go
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Lisp
Plug 'tpope/vim-fireplace'

" Fuzzy Finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
map <C-p> :FZF<CR>

" Buffer helper
Plug 'mhinz/vim-sayonara'
" Close buffers
cnoreabbrev W w
cnoreabbrev wq w<bar>Sayonara
cnoreabbrev Wq w<bar>Sayonara
cnoreabbrev WQ w<bar>Sayonara
cnoreabbrev q Sayonara
cnoreabbrev Q Sayonara
cnoreabbrev qq q
cnoreabbrev E e

" TypeScript
" Plug 'leafgarland/typescript-vim'

" Whitespace
Plug 'ntpeters/vim-better-whitespace'

" Theme
Plug 'ajmwagar/vim-deus'

" Initialize plugin system
call plug#end()

" Disables comment autocomplete
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Line numbers
set relativenumber
set number
nnoremap <F2> :set nonumber! norelativenumber! <CR>

" Common typos
" command! Wq wq
" command! WQ wq
" command! W w
" command! Q q
" command! Tabn tabn
" command! Tabp tabp

" Navigate buffers
" nnoremap [1;7D :bprevious<CR>
" nnoremap [1;5D :bprevious<CR>
" nnoremap [1;7C :bnext<CR>
" nnoremap [1;5C :bnext<CR>
nnoremap <C-j> :bnext<CR>
nnoremap <C-k> :bprevious<CR>
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprevious<CR>
nnoremap <C-t> :enew<CR>

" Keep multiple buffers unsaved
set hidden

" Case Insensitive
set ignorecase
set smartcase

" Tabs
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" Highlight
highlight CursorLine cterm=NONE ctermbg=black guibg=black
highlight Search cterm=NONE ctermfg=black ctermbg=lightblue
set cursorline
set hlsearch

" Use theme
colorscheme deus

