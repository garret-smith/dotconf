
set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-sleuth'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdtree'
"Bundle 'scrooloose/syntastic'
Bundle 'altercation/vim-colors-solarized'
Bundle 'jimenezrick/vimerl'
Bundle 'tpope/vim-markdown'
Bundle 'wesgibbs/vim-irblack'
Bundle 'gregsexton/gitv'
Bundle 'mbbill/undotree'
Bundle 'Valloric/YouCompleteMe'
Bundle 'lastpos.vim'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'rking/ag.vim'
Bundle 'majutsushi/tagbar'
Bundle 'edkolev/erlang-motions.vim'

filetype plugin indent on

syntax on

set backup
set backupdir=~/.vim/backups

set wildmenu
set wildmode=longest,list
set wildignore+=*/.git/*,*.class,*.beam
set shell=zsh
set nowrap
set relativenumber
set number

set backspace=indent,eol,start
set complete=.,w,t
set completeopt=menuone,preview
set showmatch

set smarttab
set shiftround
set expandtab

set ttimeout
set ttimeoutlen=50

set incsearch
set laststatus=2
set showcmd

set scrolloff=5
set sidescrolloff=5
set display+=lastline

set autoread
set fileformats+=mac

set history=1000

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,latin-1

set lazyredraw

nmap j gj
nmap k gk

if filereadable("cscope.out")
  cs add cscope.out
endif
set cscopetag cscopeverbose
set csto=1
nmap \s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap \g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap \t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap \e :cs find e <C-R>=expand("<cword>")<CR><CR>

nmap <C-\>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>

"let g:erlang_use_conceal = 1
"let g:erlang_completion_cache = 0

let g:ctrlp_clear_cache_on_exit=1
let g:ctrlp_user_command = { 'types': {1: ['.git', 'cd %s && git ls-files'] }, 'fallback': 'find %s -type f -maxdepth 5 -not \( -path "*/.*" -or -name ".*" -or -name ".*~"\)' }

nmap <leader>gv :Gitv --all<cr>
nmap <leader>gV :Gitv! --all<cr>
vmap <leader>gV :Gitv! --all<cr>

nmap ; :CtrlPMixed<CR>
nmap \n :NERDTreeTabsToggle<CR>
nnoremap Q <nop>
cabbrev qt :tabclose<CR>

nnoremap <silent> <F9> :TagbarToggle<CR>
let g:tagbar_autoclose = 1

if has("persistent_undo")
  set undodir='~/.vim/undodir/'
  set undofile
endif

"let g:solarized_contrast="low"
let g:solarized_visibility="high"
set bg=dark
let g:no_bg=1
"colo lowc
colo solarized

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tagbar#enabled = 1

"let g:airline_theme='solarized'
"let g:airline_solarized_bg='dark'

let NERDTreeDirArrows = 0
let NERDTreeIgnore = ['\.beam$', '\.class$']
autocmd FileType erlang setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4

let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_cache_omnifunc = 0

