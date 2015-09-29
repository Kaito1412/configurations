call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'shawncplus/phpcomplete.vim'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'rking/ag.vim'
call plug#end()

"Plug 'Valloric/YouCompleteMe', {'do': './install.sh --clang-completer --system-libclang'}

set mouse=a
set backup
set number
set relativenumber
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
inoremap <LeftMouse> <nop>
inoremap <2-LeftMouse> <nop>
inoremap <3-LeftMouse> <nop>
inoremap <4-LeftMouse> <nop>
nnoremap <LeftMouse> <nop>
nnoremap <2-LeftMouse> <nop>
nnoremap <3-LeftMouse> <nop>
nnoremap <4-LeftMouse> <nop>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:airline_powerline_fonts = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

filetype plugin on
