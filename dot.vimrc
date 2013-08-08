
execute pathogen#infect()
syntax on
filetype plugin indent on

set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colo solarized

au Filetype html,xml,xsl,erlang source ~/.vim/scripts/closetag.vim
set backup
set backupdir=~/.vim/backups
set wildmode=longest,list
set wildignore+=*/.git/*,*.class,*.beam
set shell=zsh
set so=3
set nowrap
set number

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

let g:erlangHighlightBif = 1
let g:erlangManPath='~/lib/erlang/man'
let g:erlangCompletionGrep='grep'

let g:ctrlp_by_filename=1
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_custom_ignore={'dir': '\v[\/]\.(git|svn)$', 'file': '\v\.(o|png)$'}
"let g:ctrlp_user_command = { 'types': {1: ['.git', 'cd %s && git ls-files'] }, 'fallback': 'find %s -type f'}

nmap ; :CtrlPBuffer<CR>

nmap \n :NERDTreeToggle<CR>

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

" set tabline=%!MyTabLine()

" For FreeBSD, in case they're not in the TERMCAP
"let &t_ti = "\<Esc>[?47h"
"let &t_te = "\<Esc>[?47l"

