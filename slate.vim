hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "slate"

if exists("no_bg")
  hi Normal        ctermfg=245         ctermbg=None       cterm=None
  hi Cursor        ctermfg=245         ctermbg=None       cterm=None
  hi SpecialKey    ctermfg=245         ctermbg=None       cterm=None
  hi Directory     ctermfg=245         ctermbg=None       cterm=None
  hi ErrorMsg      ctermfg=245         ctermbg=None       cterm=None
  hi PreProc       ctermfg=245         ctermbg=None       cterm=None
  hi Search        ctermfg=245         ctermbg=None       cterm=None
  hi Type          ctermfg=245         ctermbg=None       cterm=None
  hi Statement     ctermfg=245         ctermbg=None       cterm=None
  hi Comment       ctermfg=245         ctermbg=None       cterm=None
  hi Identifier    ctermfg=245         ctermbg=None       cterm=None
  hi DiffText      ctermfg=245         ctermbg=None       cterm=None
  hi Constant      ctermfg=245         ctermbg=None       cterm=None
  hi Todo          ctermfg=245         ctermbg=None       cterm=Bold
  hi Error         ctermfg=245         ctermbg=None       cterm=None
  hi Special       ctermfg=245         ctermbg=None       cterm=None
  hi Ignore        ctermfg=245         ctermbg=None       cterm=None
  hi Underline     ctermfg=245         ctermbg=None       cterm=Underline
  hi Visual        ctermfg=245         ctermbg=None       cterm=Reverse

  hi FoldColumn    ctermfg=245         ctermbg=None       cterm=None
  hi ColorColumn   ctermfg=235         ctermbg=239        cterm=None
  hi StatusLineNC  ctermfg=245         ctermbg=None       cterm=None
  hi StatusLine    ctermfg=245         ctermbg=None       cterm=None
  hi VertSplit     ctermfg=245         ctermbg=None       cterm=None

  hi LineNr        ctermfg=245         ctermbg=None       cterm=None
  hi CursorLineNr  ctermfg=246         ctermbg=None       cterm=Bold
  hi NonText       ctermfg=245         ctermbg=None       cterm=None

  hi MatchParen    ctermfg=245         ctermbg=None       cterm=Bold

  hi WarningMsg    ctermfg=245         ctermbg=None       cterm=Bold
  hi SpellBad      ctermfg=245         ctermbg=None       cterm=None
  hi SpellCap      ctermfg=245         ctermbg=None       cterm=None

  hi Pmenu         ctermfg=245         ctermbg=239        cterm=None
  hi PmenuSel      ctermfg=245         ctermbg=241        cterm=None

  hi TabLine       ctermfg=245         ctermbg=None       cterm=Reverse
else
  hi Normal        ctermfg=245         ctermbg=235        cterm=None
  hi Cursor        ctermfg=245         ctermbg=235        cterm=None
  hi SpecialKey    ctermfg=245         ctermbg=235        cterm=None
  hi Directory     ctermfg=245         ctermbg=235        cterm=None
  hi ErrorMsg      ctermfg=245         ctermbg=235        cterm=None
  hi PreProc       ctermfg=245         ctermbg=235        cterm=None
  hi Search        ctermfg=245         ctermbg=235        cterm=None
  hi Type          ctermfg=245         ctermbg=235        cterm=None
  hi Statement     ctermfg=245         ctermbg=235        cterm=None
  hi Comment       ctermfg=245         ctermbg=235        cterm=None
  hi Identifier    ctermfg=245         ctermbg=235        cterm=None
  hi DiffText      ctermfg=245         ctermbg=235        cterm=None
  hi Constant      ctermfg=245         ctermbg=235        cterm=None
  hi Todo          ctermfg=245         ctermbg=235        cterm=Bold
  hi Error         ctermfg=245         ctermbg=235        cterm=None
  hi Special       ctermfg=245         ctermbg=235        cterm=None
  hi Ignore        ctermfg=245         ctermbg=235        cterm=None
  hi Underline     ctermfg=245         ctermbg=235        cterm=Underline
  hi Visual        ctermfg=245         ctermbg=235        cterm=Reverse

  hi FoldColumn    ctermfg=245         ctermbg=235        cterm=None
  hi ColorColumn   ctermfg=235         ctermbg=239        cterm=None
  hi StatusLineNC  ctermfg=245         ctermbg=235        cterm=None
  hi StatusLine    ctermfg=245         ctermbg=235        cterm=None
  hi VertSplit     ctermfg=245         ctermbg=235        cterm=None

  hi LineNr        ctermfg=245         ctermbg=235        cterm=None
  hi CursorLineNr  ctermfg=246         ctermbg=235        cterm=Bold
  hi NonText       ctermfg=245         ctermbg=235        cterm=None

  hi MatchParen    ctermfg=245         ctermbg=235        cterm=Bold

  hi WarningMsg    ctermfg=245         ctermbg=235        cterm=Bold
  hi SpellBad      ctermfg=245         ctermbg=235        cterm=None
  hi SpellCap      ctermfg=245         ctermbg=235        cterm=None

  hi Pmenu         ctermfg=245         ctermbg=239        cterm=None
  hi PmenuSel      ctermfg=245         ctermbg=241        cterm=None

  hi TabLine       ctermfg=245         ctermbg=235        cterm=Reverse
endif


