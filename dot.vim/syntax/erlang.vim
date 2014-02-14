
if !exists("g:erlang_use_conceal")
  let g:erlang_use_conceal = 0
endif

if g:erlang_use_conceal
  syntax match Conceal "=<" conceal cchar=≤
  syntax match Conceal ">=" conceal cchar=≥
  syntax match Conceal "=:=" conceal cchar=≡
  "syntax match Conceal "=/=" conceal cchar=≢
  syntax match Conceal "/=" conceal cchar=≠
  syntax match Conceal "->" conceal cchar=→
  syntax match Conceal "<-" conceal cchar=←
  syntax match Conceal "<<" conceal cchar=«
  syntax match Conceal ">>" conceal cchar=»
  syntax match Conceal "||" conceal cchar=║

  syntax keyword Conceal2 fun conceal cchar=λ
  syntax keyword Conceal2 not conceal cchar=¬

  hi! def link Conceal Normal
  hi! def link Conceal2 Normal

  setlocal conceallevel=1
  setlocal concealcursor=n
endif

