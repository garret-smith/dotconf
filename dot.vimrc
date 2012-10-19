" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 Sep 19
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype on " detect the type of file
set history=1000 " How many lines of history to remember
set cf " enable error files and error jumping
set ffs=unix,dos,mac " support all three, in this order
filetype plugin on " load filetype plugins
set viminfo+=! " make sure it can save viminfo
set isk+=_,$,@,%,#,- " none of these should be word dividers, so make them not be

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set backup		" keep a backup file
set backupdir=~/.vim/backups
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands

set shell=tcsh

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")
" Don't use Ex mode, use Q for formatting
" map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  autocmd GUIEnter * set vb t_vb=

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
  
    augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

syntax on

set number
"set lz
set nowrap
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$ " what to show when I hit :set list
set so=3 " Keep n lines (top/bottom) for scope
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2 " always show the status line

set showmatch " show matching brackets
set mat=3 " how many tenths of a second to blink matching brackets for
set nohlsearch " do not highlight searched for phrases
set incsearch " BUT do highlight as you type you search phrase
"set nomodeline

set wildmode=longest,list
set wildignore+=*.class,*.beam

" restore screen after exiting vim
"set t_ti=7[r[?47h t_te=[?47l8

set noerrorbells

let mapleader = "\\"

"delete the buffer; keep windows
function Kwbd(kwbdStage)
if(a:kwbdStage == 1)
	let g:kwbdBufNum = bufnr("%")
	let g:kwbdWinNum = winnr()
	windo call Kwbd(2)
	execute "bd! " . g:kwbdBufNum
	execute "normal " . g:kwbdWinNum . ""
else
	if(bufnr("%") == g:kwbdBufNum)
		let prevbufvar = bufnr("#")
		if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != g:kwbdBufNum)
			b #
		else
			bn
		endif
	endif
endif
endfunction

nmap <Leader>bd :call Kwbd(1)<CR>

function MyTabLine()
  let tl = []
  for i in range(tabpagenr('$'))
    let s = ""
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTabLabel()
    let s .= '%{MyTabLabel(' . (i + 1) . ')}'
    call add(tl, s)
  endfor

  let s = join(tl, "%#TabLine#  ")
  let s .= '%#TabLineFill#%T'

  return s
endfunction

function MyTabLabel(tabnr)
  let buflist = tabpagebuflist(a:tabnr)
  let s = []
  for bufnr in buflist
    let bufnm = substitute(bufname(bufnr), '.*/', '', '')
    if bufnm =~ "^__"
      continue
    endif
    let modified = ''
    if getbufvar(bufnr, '&modified') != 0
      let modified = '*'
    endif
    call add(s, bufnr . ":" . bufnm . modified)
  endfor
  return a:tabnr . "[" . join(s, ", ") . "]"
endfunction

function GuiTabLabel()
  let buflist = tabpagebuflist(v:lnum)
  let s = []
  for bufnr in buflist
    let bufnm = substitute(bufname(bufnr), '.*/', '', '')
    if bufnm =~ "^__"
      continue
    endif
    let modified = ''
    if getbufvar(bufnr, '&modified') != 0
      let modified = '*'
    endif
    call add(s, bufnr . ":" . bufnm . modified)
  endfor
  return v:lnum . "[" . join(s, ", ") . "]"
endfunction

set tabline=%!MyTabLine()

set guitablabel=%{GuiTabLabel()}

function SpcIndent()
  set tabstop=4
  set shiftwidth=4
  set softtabstop=4
  set expandtab
endfunction

function TabIndent()
  set tabstop=8
  set shiftwidth=8
  set softtabstop=0
  set noexpandtab
endfunction

"let Tlist_Inc_Winwidth=0

" set langmap=s;;
" set langmap=;z;
" set langmap='q,\,w,.e,pr,yt,fy,gu,ci,ro,lp,/[,=],os,ed,uf,ig,dh,hj,tk,nl,-',qx,jc,kv,xb,bn,mm,w\,,v.,z/,[-,]=,\"Q,<W,>E,PR,YT,FY,GU,CI,RO,LP,?{,+},AA,OS,ED,UF,IG,DH,HJ,TK,NL,S:,_\",:Z,QX,JC,KV,XB,BN,MM,W<,V>,Z?

" commented out for rxvt
set t_Co=256
"set t_Co=80

if v:progname =~? "vimdiff"
  colo cust_inkpot
elseif v:progname =~? "gvim"
  colo ir_black
  "set guifont=-windows-proggysquaresz-medium-r-normal-*-*-80-*-*-c-*-iso8859-1
  set guifont="Source Code Pro"
  set guioptions-=m
  set guioptions-=T
  "set guioptions-=r
  set guioptions+=c
else
  colo cust_inkpot
endif

let g:erlangFold = 0
let g:erlangFoldSplitFunction = 0
let g:erlangHighlightBif = 1

let g:EasyMotion_leader_key = '<Leader>'

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

