" ============================================
" File: vimrc
" Author: Thibaut Perol <tperol@alumni.harvard.edu>
" Created: 2016-01-25
" ============================================
" Configuration and Plugins
"
" ============================================
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
set textwidth=79
set softtabstop=4
set shiftround
set tabstop=4
set shiftwidth=4
set expandtab
set encoding=utf-8
set spell spelllang=en_us
set splitright
set splitbelow
set backspace=indent,eol,start "delete
set ai " Auto indent
set si "Smart indent
set scrolloff=1 "minimum line between cursor and window edge"
set showcmd "show partially typed commands"
set showmatch "show parenthesis matching"
set viminfo='0,\"100,           
set noerrorbells
set textwidth=0 
set wrapmargin=0
set ttyfast
set lazyredraw
set regexpengine=1


" ============================================
" Aesthetics
" ============================================
" syntax on                       " Use color syntax highlighting.
syntax enable
filetype plugin on
filetype indent on
" colorscheme monokai

let g:solarized_termtrans=1
colorscheme solarized
set bg=dark
colorscheme solarized


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
Plugin 'benmills/vimux'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/a.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tommcdo/vim-exchange'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tmux-plugins/tpm'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mileszs/ack.vim'
Plugin 'gregsexton/gitv'
Plugin 'sjl/gundo.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/MatlabFilesEdition'
Plugin 'vim-latex/vim-latex'
"
call vundle#end()
filetype plugin indent on    " required


" ============================================
" Keys remapped
" ============================================
let mapleader=","
inoremap jk <ESC>
inoremap kj <ESC>
nnoremap ; :
nmap oo o<Esc>k
nmap OO O<Esc>j


" ============================================
"Search options
" ============================================
" 
nnoremap / /\v
vnoremap / /\v
nmap <silent> ,/ :nohlsearch<CR>
set ignorecase                  " case insensitive search
set smartcase
set incsearch                   " find as you type search
set gdefault                    " global search and replace
set hlsearch                   " highlight search terms

" ============================================
" Windows navigation
" ============================================
" Creating new panes and windows
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Navigation between windows using keys 
nmap <c-j> <c-w>j
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l
nmap <c-k> <c-w>k

" Navigation between windows using window number
let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
        let i = i + 1
        endwhile

" Increase the size of the windows
nnoremap <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Go out of brackets
inoremap <C-e> <C-o>A

" ===========================================
"  shift key fixes
" ============================================
if !exists('g:spf13_no_keyfixes')
    if has("user_commands")
        command! -bang -nargs=* -complete=file E e<bang> <args>
        command! -bang -nargs=* -complete=file W w<bang> <args>
        command! -bang -nargs=* -complete=file Wq wq<bang> <args>
        command! -bang -nargs=* -complete=file WQ wq<bang> <args>
        command! -bang Wa wa<bang>
        command! -bang WA wa<bang>
        command! -bang Q q<bang>
        command! -bang QA qa<bang>
        command! -bang Qa qa<bang>
    endif
    cmap Tabe tabe
endif 


" ============================================
" Python settings and compilation
" ============================================
let python_highlight_all=1
let g:vim_markdown_folding_disabled = 1
let g:markdown_syntax_conceal = 0

" ===========================================
" " Tagbar
" ============================================
nnoremap <leader>y :Tagbar<CR>

" ===========================================
" " Vimux
" ============================================
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>

" ============================================
" Gundo , undo tree
" ============================================
nnoremap <leader>z :GundoToggle<CR>

" ============================================
" CtrlP
" ============================================
nnoremap <leader>t :CtrlPMixed<CR>

" ============================================
" Nerd Tree
" ============================================
nnoremap <leader>r :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" ============================================
" Gitv
" ============================================
nnoremap <leader>g :Gitv<CR>
nnoremap <leader>h :Gitv!<CR>

" ============================================
" tmux save sessions
" ============================================
" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch =2"

" ============================================
"" call Ack
" ============================================
nnoremap <leader>a :Ack


" ============================================
" Tabs handling
" ============================================
nnoremap <leader>q :tabp<CR>
nnoremap <leader>w :tabn<CR>
nnoremap <leader>e :tabnew<CR>

" ============================================
" Remap tab for autocompletion with dictionary
" ============================================
function! Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
    endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
set dictionary="/usr/dict/words"

" ============================================
" Ignore these folders for fuzzy matching
" ============================================
set wildignore=data/**,lib/**,build/**,import/**,log/**,external/**,output/**,bin/**,doc/**,third_party/**
set wildmenu                  " show list instead of just completing
" " command <Tab> completion, list matches, then longest common part, then
" all.
set wildmode=list:longest,full

" ============================================
" Strip trailing whitespace
" ============================================
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
" Apply to all python and javascript files
autocmd BufWritePre *.py,*.js :call <SID>StripTrailingWhitespaces()

" ============================================
" Use Q for formatting the current paragraph (or selection)
" ============================================
vmap Q gq
nmap Q gqap

" ============================================
" vertical splitting when diff
" ============================================
set diffopt+=vertical

" ============================================
" Python file headers
" ============================================
autocmd bufnewfile *.py so /Users/tperol/py_header.txt
autocmd bufnewfile *.py exe "1," . 6 . "g/File Name :.*/s//File Name : " .expand("%")
autocmd bufnewfile *.py exe "1," . 6 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.py execute "normal ma"
autocmd Bufwritepre,filewritepre *.py exe "1," . 6 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.py execute "normal `a"

" ============================================
" Tab for YouCompleteMe 
" ============================================
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']


