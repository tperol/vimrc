" Configuration
"
" " Pathogen first

execute pathogen#infect()

" ' basic settings
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
set colorcolumn=80

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

" Aesthetics

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
