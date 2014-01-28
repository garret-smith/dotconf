
set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
"Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-sleuth'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'altercation/vim-colors-solarized'
Bundle 'sanmiguel/vimerl'
Bundle 'jnurmine/Zenburn'
Bundle 'tpope/vim-markdown'
Bundle 'wesgibbs/vim-irblack'
Bundle 'gregsexton/gitv'
"Bundle 'majutsushi/tagbar'
"Bundle 'mileszs/ack.vim'
Bundle 'mbbill/undotree'
Bundle 'Valloric/YouCompleteMe'
Bundle 'fxn/vim-monochrome'
Bundle 'lastpos.vim'

filetype plugin indent on

syntax on
set background=dark
colo solarized

set backup
set backupdir=~/.vim/backups

set wildmenu
set wildmode=longest,list
set wildignore+=*/.git/*,*.class,*.beam
set shell=zsh
set nowrap
"set number

set backspace=indent,eol,start
"set complete-=i
set showmatch
set smarttab
set shiftround

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

let g:erlangManPath='~/lib/erlang/man'
let g:erlangCompletionGrep='grep'
let g:erlang_folding=1
let g:erlangHighlightBif=1
let g:erlangFoldSplitFunction=1
let g:erlangCheckFile='~/.vim/bundle/vimerl/compiler/erlang_check.erl'

let g:ctrlp_clear_cache_on_exit=1
let g:ctrlp_user_command = { 'types': {1: ['.git', 'cd %s && git ls-files'] }, 'fallback': 'find %s -type f -maxdepth 5 -not \( -path "*/.*" -or -name ".*" \)' }

nmap <leader>gv :Gitv --all<cr>
nmap <leader>gV :Gitv! --all<cr>
vmap <leader>gV :Gitv! --all<cr>

nmap ; :CtrlPBuffer<CR>
nmap \n :NERDTreeToggle<CR>
nnoremap Q <nop>
cabbrev qt :tabclose<CR>

set lazyredraw

let g:erlang_use_conceal=0

if has("persistent_undo")
  set undodir='~/.vim/undodir/'
  set undofile
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

