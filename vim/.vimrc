call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe', {'do': './install.sh --clang-completer --system-libclang'}
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'rking/ag.vim'

call plug#end()

set backup
set number
set expandtab
set shiftwidth=4
set softtabstop=4
syntax enable
colorscheme monokai
set colorcolumn=80
set backupdir=~/.vim/backup_files//
set directory=~/.vim/swap_files//
set undodir=~/.vim/undo_files//
set cursorline

inoremap jk <Esc>
inoremap <del>   <nop>
nnoremap <del>   <nop>
inoremap <end>   <nop>
nnoremap <end>   <nop>
inoremap <Home>  <nop>
inoremap <PageUp> <nop>
inoremap <PageDown> <nop>
nnoremap <Home> <nop>
nnoremap <PageUp> <nop>
nnoremap <PageDown> <nop>
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
