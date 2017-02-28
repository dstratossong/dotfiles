" Vim-Plug
call plug#begin('~/.vim/plugged')

" Basic agreeable settings
Plug 'tpope/vim-sensible'

" Airline
Plug 'vim-airline/vim-airline'

" Autocompletion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Lisp
Plug 'bhurlow/vim-parinfer'

" Initialize plugin system
call plug#end()

" Disables comment autocomplete
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Line numbers
set relativenumber
set number
nnoremap <F2> :set nonumber! norelativenumber! <CR>

" Common typos
command! Wq wq
command! W w
command! Q q

" Tabs
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
