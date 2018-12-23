" Vim-Plug
call plug#begin('~/.vim/plugged')

" Basic agreeable settings
Plug 'tpope/vim-sensible'

" Airline
Plug 'vim-airline/vim-airline'
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Autocompletion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --gocode-completer --tern-completer' }

" Lisp
" Plug 'bhurlow/vim-parinfer'

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
map  :FZF<CR>

" Buffer helper
Plug 'mhinz/vim-sayonara'
" Close buffers
cnoreabbrev wq w<bar>Sayonara
cnoreabbrev Wq w<bar>Sayonara
cnoreabbrev WQ w<bar>Sayonara
cnoreabbrev q Sayonara
cnoreabbrev Q Sayonara

" TypeScript
" Plug 'leafgarland/typescript-vim'

" Initialize plugin system
call plug#end()

" Disables comment autocomplete
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Line numbers
set relativenumber
set number
nnoremap <F2> :set nonumber! norelativenumber! <CR>

" Common typos
command! W w
" Replaced with Sayonara
" command! Wq wq
" command! Q q
" command! WQ wq
command! Q q
" Tabs
" command! Tabf tabf
" command! Tabn tabn
" command! Tabp tabp

" Case insensitive
set ignorecase
set smartcase

" Tabs
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" New buffer
map  :enew<CR>

" Switch buffers
map [5;5~ :bprevious<CR>
map [6;5~ :bnext<CR>

" Highlight
highlight CursorLine cterm=NONE ctermbg=black guibg=black
set cursorline
