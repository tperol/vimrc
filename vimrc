" ============================================
" File: vimrc
" Author: Thibaut Perol <tperol@alumni.harvard.edu>
" Created: 2016-01-25
" ============================================
" Configuration and Plugins
" (inspired by mgharbi settings)
"
" ============================================
"
"
"
set colorcolumn=80
set nocompatible " be iMproved
filetype off     " required

" ============================================
"  basic settings
" ============================================
syntax on
set ruler
set background=dark
set number
set hidden
filetype plugin indent on
set textwidth=79
set softtabstop=4
set shiftround
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set encoding=utf-8
set spell spelllang=en_us
set splitright
set splitbelow



" ============================================
" Vundle Plugins 
" ============================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" " let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'
"
" " Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" Plugin 'vim-scripts/a.vim'
" Plugin 'Raimondi/delimitMate'
" Plugin 'tpope/vim-surround'
" Plugin 'kien/ctrlp.vim'
" Plugin 'godlygeek/tabular'
" Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-commentary'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
" Plugin 'Lokaltog/vim-easymotion'
" Plugin 'mileszs/ack.vim'
" Plugin 'gregsexton/gitv'
" Plugin 'sjl/gundo.vim'
" Plugin 'google/vim-ft-bzl'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
" Plugin 'vim-scripts/MatlabFilesEdition'
"
call vundle#end()
filetype plugin indent on    " required


" Keys remapped

inoremap jk <ESC>

" let mapleader=","
map }leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>
nmap oo o<Esc>k
nmap OO O<Esc>j

" Python settings

let python_highlight_all=1

" " Tagbar
nnoremap <leader>l :Tagbar<CR>
"
" Aesthetics
syntax on                       " Use color syntax highlighting.
filetype plugin on
filetype indent on
let g:solarized_termtrans=1
colorscheme solarized
set bg=dark
colorscheme solarized

" Remap tab for autocompletiong
function! Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
    endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
set dictionary="/usr/dict/words"

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
" Remap strip trailing whitespace to F5
nnoremap <silent> <F6> :call <SID>StripTrailingWhitespaces()<CR>
" Apply to all python and javascript files
autocmd BufWritePre *.py,*.js :call <SID>StripTrailingWhitespaces()

" Gundo remap
nnoremap <F5> :GundoToggle<CR>

" Navigation between windows using directions
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k

" Navigation between windows using window number
let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
        let i = i + 1
        endwhile
" vertical splitting when diff
set diffopt+=vertical

" autocmd bufnewfile *.py so /Users/tperol/py_header.txt
" autocmd bufnewfile *.py exe "1," . 6 . "g/File Name :.*/s//File Name : " .expand("%")
" autocmd bufnewfile *.py exe "1," . 6 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
" autocmd Bufwritepre,filewritepre *.py execute "normal ma"
" autocmd Bufwritepre,filewritepre *.py exe "1," . 6 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
" autocmd bufwritepost,filewritepost *.py execute "normal `a"
