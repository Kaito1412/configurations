call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'edsono/vim-matchit'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'jscs-dev/node-jscs'
Plug 'kannokanno/previm'
Plug 'mileszs/ack.vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'Raimondi/delimitMate'
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/closetag.vim'
call plug#end()

syntax enable
colorscheme monokai
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

set backup
set backupdir=~/.vim/backup_files//
set colorcolumn=80
set cursorline
set directory=~/.vim/swap_files//
set expandtab
set mouse=a
set number
set relativenumber
set shiftwidth=4
set softtabstop=4
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set undodir=~/.vim/undo_files//
set pastetoggle=<F2>

let g:airline_powerline_fonts = 1
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:previm_open_cmd = 'firefox'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

nmap     <Enter>       [<Space>
nnoremap j             gj
nnoremap k             gk
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

function SetHTMLOptions()
    let g:html5_event_handler_attributes_complete = 1
    let g:html5_rdfa_attributes_complete = 1
    let g:html5_microdata_attributes_complete = 1
    let g:html5_aria_attributes_complete = 1
endfunction

function SetJavaScriptOptions()
    set colorcolumn=120
endfunction

function SetPHPOptions()
    let g:phpcomplete_relax_static_constraint = 1
    let g:phpcomplete_complete_for_unknown_classes = 1
    let g:phpcomplete_search_tags_for_variables = 1
    let g:phpcomplete_parse_docblock_comments = 1
    set colorcolumn=85
endfunction

function SetPythonOptions()
    let g:syntastic_javascript_checkers = ['jshint', 'jscs']
    nnoremap <buffer> <F4> :exec '!clear; python' shellescape(@%, 1)<cr>
endfunction

augroup PrevimSettings
    autocmd!
    filetype on
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
    autocmd FileType javascript call SetJavascriptOptions()
    autocmd FileType php call SetPHPOptions()
    autocmd FileType python call SetPythonOptions()
augroup END
