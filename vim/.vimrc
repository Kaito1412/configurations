call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'rking/ag.vim'
Plug 'othree/html5.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'pangloss/vim-javascript'
Plug 'kannokanno/previm'
Plug 'tpope/vim-unimpaired'
call plug#end()


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


nmap     <Enter>       [<Space> 
nnoremap <end>         <nop>
nnoremap <Home>        <nop>
nnoremap <PageUp>      <nop>
nnoremap <PageDown>    <nop>
nnoremap <up>          <nop>
nnoremap <down>        <nop>
nnoremap <left>        <nop>
nnoremap <right>       <nop>
nnoremap <del>         <nop>
nnoremap <LeftMouse>   <nop>
nnoremap <2-LeftMouse> <nop>
nnoremap <3-LeftMouse> <nop>
nnoremap <4-LeftMouse> <nop>
inoremap jk            <Esc>
inoremap <del>         <nop>
inoremap <end>         <nop>
inoremap <Home>        <nop>
inoremap <PageUp>      <nop>
inoremap <PageDown>    <nop>
inoremap <up>          <nop>
inoremap <down>        <nop>
inoremap <left>        <nop>
inoremap <right>       <nop>
inoremap <LeftMouse>   <nop>
inoremap <2-LeftMouse> <nop>
inoremap <3-LeftMouse> <nop>
inoremap <4-LeftMouse> <nop>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:previm_open_cmd = 'firefox'
let g:airline_powerline_fonts = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

filetype plugin on
