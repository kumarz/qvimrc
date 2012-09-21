set nocompatible
filetype off

syntax on
set mouse=a

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'pangloss/vim-javascript'

" Railscasts
Bundle 'jgdavey/vim-railscasts'
" colorscheme railscasts
" Will be written in build.

" Powerline
Bundle 'Lokaltog/vim-powerline'
let g:Powerline_symbols = 'compatible'
set laststatus=2
set t_Co=256

" Zencoding
Bundle 'mattn/zencoding-vim'  
let g:user_zen_expandabbr_key = '<C-e>'
let g:use_zen_complete_tag = 1

" NERDTree
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
nmap <C-B> :NERDTreeTabsToggle<CR>
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=0

" ConqueTerm
Bundle 'rygwdn/vim-conque'

filetype plugin indent on

set encoding=utf-8

set autochdir
set autoindent
set smartindent
set cindent
set background=dark
set expandtab
set smarttab
set softtabstop=2
set tabstop=2
set wildignore=*.pyc
set ignorecase
set smartcase
set hlsearch
set incsearch
set shiftround
set history=1000
set undolevels=1000
set noswapfile
set nobackup
set number
set linespace=3

" Omni
set omnifunc=syntaxcomplete#Complete

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Keymap

function InlineCommand()
    let l:cmd = input('Command: ')
    let l:output = system(l:cmd)
    let l:output = substitute(l:output, '[\r\n]*$', '', '')
    execute 'normal i' . l:output
endfunction

" Tab keymap
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <A-Left> :tabprevious<CR>
nnoremap <A-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <Esc>:tabnew<CR>

nnoremap <C-r> :call InlineCommand()<CR>

" Shift-tab
nmap <S-Tab> <<
imap <S-Tab> <Esc><<i