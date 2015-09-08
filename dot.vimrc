
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'jimenezrick/vimerl'
Plugin 'tpope/vim-markdown'
Plugin 'gregsexton/gitv'
Plugin 'mbbill/undotree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'lastpos.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'rking/ag.vim'
Plugin 'majutsushi/tagbar'
Plugin 'edkolev/erlang-motions.vim'

Plugin 'jceb/vim-orgmode'
Plugin 'tpope/vim-speeddating'
Plugin 'utl.vim'

Plugin 'altercation/vim-colors-solarized'
"Plugin 'wesgibbs/vim-irblack'
"Plugin 'https://github.com/gregsexton/Atom'
"Plugin 'https://github.com/gregsexton/Muon'

call vundle#end()

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
set nohlsearch
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
set csto=0
nmap \s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap \g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap \t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap \e :cs find e <C-R>=expand("<cword>")<CR><CR>

nmap <C-\>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>

set cscopequickfix=s-,c-,d-,i-,t-,e-

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
"let g:solarized_termtrans=1
set bg=dark
let g:no_bg=1
"colo lowc
colo solarized

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tagbar#enabled = 1
"let g:airline_powerline_fonts=1

"let g:airline_theme='solarized'
"let g:airline_solarized_bg='dark'

let NERDTreeDirArrows = 0
let NERDTreeIgnore = ['\.beam$', '\.class$']
autocmd FileType erlang setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4

let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_cache_omnifunc = 0

set cc=80
set tw=80
set fo-=t

