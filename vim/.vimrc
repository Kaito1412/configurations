""""""""""""""""""""""""""""""""""""""""""
" PLugins
""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" Interface
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'sickill/vim-monokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Valloric/YouCompleteMe'

" Functions
Plug 'jiangmiao/auto-pairs'
Plug 'jmcantrell/vim-virtualenv'   " :VirtualEnvActivate
Plug 'mileszs/ack.vim'             " :ack
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'

" Shortcuts
Plug 'ctrlpvim/ctrlp.vim'          " ctrl p
Plug 'tpope/vim-commentary'        " gcc
Plug 'tpope/vim-surround'          " cs
Plug 'tpope/vim-unimpaired'        "[<space> [q

" HTML
Plug 'alvan/vim-closetag'
Plug 'gregsexton/matchtag'
Plug 'mattn/emmet-vim'             " <ctrl>y,
Plug 'othree/html5.vim'

" Javascript
Plug 'leafgarland/typescript-vim'
Plug 'jscs-dev/node-jscs'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'pangloss/vim-javascript'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""
" Main options
""""""""""""""""""""""""""""""""""""""""""
syntax enable
colorscheme monokai
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

set backup
set backupdir=~/.vim/backup_files//
set colorcolumn=80
set cursorline
set diffopt+=vertical
set directory=~/.vim/swap_files//
set expandtab
set mouse=a
set number
set relativenumber
set shiftwidth=4
set showcmd
set softtabstop=4
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set undodir=~/.vim/undo_files//
set pastetoggle=<F2>

let g:ackprg = 'ag --vimgrep --smart-case'
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:previm_open_cmd = 'firefox'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:virtualenv_auto_activate = 1
let g:virtualenv_stl_format = '[%n]'


cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack


""""""""""""""""""""""""""""""""""""""""""
" Binding keys
""""""""""""""""""""""""""""""""""""""""""
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


""""""""""""""""""""""""""""""""""""""""""
" Specific configuration for each language
""""""""""""""""""""""""""""""""""""""""""
function SetHTMLOptions()
    let g:html5_aria_attributes_complete = 1
    let g:html5_event_handler_attributes_complete = 1
    let g:html5_microdata_attributes_complete = 1
    let g:html5_rdfa_attributes_complete = 1
endfunction

function SetJavascriptOptions()
    let g:syntastic_javascript_checkers = ['jshint', 'jscs']
    let g:syntastic_aggregate_errors = 1
    set colorcolumn=100
endfunction

function SetPHPOptions()
    let g:phpcomplete_complete_for_unknown_classes = 1
    let g:phpcomplete_parse_docblock_comments = 1
    let g:phpcomplete_relax_static_constraint = 1
    let g:phpcomplete_search_tags_for_variables = 1
    let g:syntastic_php_checkers = ['phpcs']
    set colorcolumn=85
endfunction

function SetPythonOptions()
    let g:syntastic_python_checkers = ['flake8']
    set colorcolumn=80
    nnoremap <buffer> <F4> :exec '!clear; python' shellescape(@%, 1)<cr>
    command! Py2 call ChangePython(2)
    command! Py3 call ChangePython(3)
endfunction

augroup PrevimSettings
    autocmd!
    filetype on
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
    autocmd FileType html call SetHTMLOptions()
    autocmd FileType javascript call SetJavascriptOptions()
    autocmd FileType php call SetPHPOptions()
    autocmd FileType python call SetPythonOptions()
augroup END

""""""""""""""""""""""""""""""""""""""""""
" Custom functions
""""""""""""""""""""""""""""""""""""""""""
" Cambia Syntastic para funcionar con Python 2.x o Python 3.x
function! ChangePython(ver)
    if a:ver == 2
        echo "Switch to Python 2.x"
        let g:syntastic_python_python_exec = '/usr/bin/python2'
        let g:syntastic_python_flake8_exec = '/usr/bin/flake8-python2'
    elseif a:ver == 3
        echo "Switch to Python 3.x"
        let g:syntastic_python_python_exec = '/usr/bin/python3'
        let g:syntastic_python_flake8_exec = '/usr/bin/flake8'
    else
        echoerr "ERROR: Unknown Python version (use 2 or 3)"
    endif
endfunction
