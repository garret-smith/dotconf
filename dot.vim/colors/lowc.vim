hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "lowc"

if exists("no_bg")
  hi Normal        ctermfg=245         ctermbg=None        cterm=None
  hi Cursor        ctermfg=250         ctermbg=None        cterm=None
  hi SpecialKey    ctermfg=245         ctermbg=None        cterm=None
  hi Directory     ctermfg=245         ctermbg=None        cterm=None
  hi ErrorMsg      ctermfg=94          ctermbg=None        cterm=None
  hi PreProc       ctermfg=245         ctermbg=None        cterm=None
  hi Search        ctermfg=245         ctermbg=240         cterm=None
  hi Type          ctermfg=245         ctermbg=None        cterm=None
  hi Statement     ctermfg=245         ctermbg=None        cterm=None
  hi Comment       ctermfg=95          ctermbg=None        cterm=None
  hi Identifier    ctermfg=245         ctermbg=None        cterm=None
  hi DiffText      ctermfg=245         ctermbg=None        cterm=None
  hi Constant      ctermfg=245         ctermbg=None        cterm=None
  hi Todo          ctermfg=245         ctermbg=None        cterm=None
  hi Error         ctermfg=94          ctermbg=None        cterm=None
  hi Special       ctermfg=245         ctermbg=None        cterm=None
  hi Ignore        ctermfg=234         ctermbg=None        cterm=None
  hi Underline     ctermfg=245         ctermbg=None        cterm=Underline
  hi Visual        ctermfg=237         ctermbg=243         cterm=None

  hi FoldColumn    ctermfg=245         ctermbg=None        cterm=None
  hi StatusLineNC  ctermfg=245         ctermbg=None        cterm=None
  hi StatusLine    ctermfg=245         ctermbg=None        cterm=None
  hi VertSplit     ctermfg=245         ctermbg=None        cterm=None

  hi LineNr        ctermfg=104         ctermbg=None        cterm=None
  hi NonText       ctermfg=64          ctermbg=None        cterm=None

  hi MatchParen    ctermfg=253         ctermbg=None        cterm=Bold

  hi WarningMsg    ctermfg=94          ctermbg=None        cterm=Bold
  hi SpellBad      ctermfg=245         ctermbg=None        cterm=None
  hi SpellCap      ctermfg=245         ctermbg=None        cterm=None

  hi Pmenu         ctermfg=234         ctermbg=244         cterm=None
  hi PmenuSel      ctermfg=234         ctermbg=250         cterm=None
else
  hi Normal        ctermfg=245         ctermbg=234         cterm=None
  hi Cursor        ctermfg=250         ctermbg=234         cterm=None
  hi SpecialKey    ctermfg=245         ctermbg=234         cterm=None
  hi Directory     ctermfg=245         ctermbg=234         cterm=None
  hi ErrorMsg      ctermfg=94          ctermbg=234         cterm=None
  hi PreProc       ctermfg=245         ctermbg=234         cterm=None
  hi Search        ctermfg=245         ctermbg=240         cterm=None
  hi Type          ctermfg=245         ctermbg=234         cterm=None
  hi Statement     ctermfg=245         ctermbg=234         cterm=None
  hi Comment       ctermfg=103         ctermbg=234         cterm=None
  hi Identifier    ctermfg=245         ctermbg=234         cterm=None
  hi DiffText      ctermfg=245         ctermbg=234         cterm=None
  hi Constant      ctermfg=245         ctermbg=234         cterm=None
  hi Todo          ctermfg=245         ctermbg=234         cterm=None
  hi Error         ctermfg=94          ctermbg=234         cterm=None
  hi Special       ctermfg=245         ctermbg=234         cterm=None
  hi Ignore        ctermfg=234         ctermbg=234         cterm=None
  hi Underline     ctermfg=245         ctermbg=234         cterm=Underline
  hi Visual        ctermfg=237         ctermbg=243         cterm=None

  hi FoldColumn    ctermfg=245         ctermbg=234         cterm=None
  hi StatusLineNC  ctermfg=245         ctermbg=234         cterm=None
  hi StatusLine    ctermfg=245         ctermbg=234         cterm=None
  hi VertSplit     ctermfg=245         ctermbg=234         cterm=None

  hi LineNr        ctermfg=104         ctermbg=234         cterm=None
  hi NonText       ctermfg=64          ctermbg=234         cterm=None

  hi MatchParen    ctermfg=253         ctermbg=234         cterm=Bold

  hi WarningMsg    ctermfg=94          ctermbg=234         cterm=Bold
  hi SpellBad      ctermfg=245         ctermbg=234         cterm=None
  hi SpellCap      ctermfg=245         ctermbg=234         cterm=None

  hi Pmenu         ctermfg=234         ctermbg=244         cterm=None
  hi PmenuSel      ctermfg=234         ctermbg=250         cterm=None
endif

