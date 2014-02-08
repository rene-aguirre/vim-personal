" Vim color file
" Maintainer:	Rene Aguirre
" Last Change:	$Date: $
" Last Change:	$Date: $
" URL:		
" Version:	$Id: $

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="desert"

hi Normal       guifg=White         guibg=grey15
"hi Normal        guifg=#e5e5e5 guibg=#212121 gui=NONE

" highlight groups
hi Cursor       guifg=khaki         guibg=indianred
"hi CursorIM
"hi Directory
"
hi DiffAdd      guifg=#e8e8e8  guibg=#104410 gui=NONE
hi DiffChange   guifg=#e8e8e8  guibg=#004858 gui=NONE
hi DiffDelete   guifg=#000000  guibg=#680000 gui=NONE
hi DiffText     guifg=#000000  guibg=#cca734 gui=NONE
"hi ErrorMsg
hi VertSplit    guifg=grey50        guibg=#c2bfa5   gui=none
hi Folded       guifg=gold          guibg=grey30        
hi FoldColumn   guifg=tan           guibg=grey30        
hi IncSearch    guifg=slategrey     guibg=khaki
hi LineNr       guifg=gray50        guibg=gray20
"hi CursorLine                       guibg=Grey25
hi CursorLine   guifg=NONE          guibg=#2e2e2e gui=NONE
hi CursorLineNr guifg=#87ceeb       guibg=NONE    gui=NONE
hi CursorColumn guifg=NONE    guibg=#2e2e2e gui=NONE
hi ColorColumn  guifg=NONE    guibg=#3e3739 gui=NONE
hi ModeMsg      guifg=goldenrod
hi MoreMsg      guifg=SeaGreen
hi NonText      guifg=LightBlue     guibg=bg
hi Question     guifg=springgreen   
hi Search       guifg=#dfffdf       guibg=grey50
hi SpecialKey   guifg=yellowgreen   
hi StatusLine   guifg=black         guibg=#c2bfa5   gui=none
hi StatusLineNC guifg=grey50        guibg=#c2bfa5   gui=none
hi Title        guifg=indianred
hi Visual       guifg=khaki         guibg=olivedrab gui=none
"hi VisualNOS
hi WarningMsg   guifg=salmon
"hi WildMenu
"hi Menu
"hi Scrollbar
"hi Tooltip
hi MatchParen   guifg=#dfffdf       guibg=#a02020 

hi Title         guifg=#c9f0fa guibg=NONE    gui=NONE

" syntax highlighting groups
hi Boolean      guifg=#fff159     guibg=NONE    gui=NONE
hi Character    guifg=#ff8da1     guibg=NONE    gui=NONE
" hi Comment	    guifg=#30c8c8     guibg=NONE    gui=NONE
"hi Comment       guifg=#27b727 guibg=NONE    gui=NONE
 hi Comment	    guifg=SkyBlue     guibg=NONE    gui=NONE
hi Constant	    guifg=#ffa0a0     guibg=NONE    gui=NONE
hi Conditional  guifg=#e4d00a     guibg=NONE    gui=NONE
hi Exception    guifg=#e4d00a     guibg=NONE    gui=NONE
hi Float        guifg=#fff159     guibg=NONE    gui=NONE
hi Function     guifg=#d0fcbc     guibg=NONE    gui=NONE
hi Identifier	guifg=palegreen   guibg=NONE    gui=NONE
hi Number       guifg=#fff159     guibg=NONE    gui=NONE
hi Operator     guifg=#ff8036     guibg=NONE    gui=NONE
hi PreProc	    guifg=#b04040     guibg=NONE    gui=NONE
hi PreCondit    guifg=#9aaa35     guibg=NONE    gui=NONE
hi Special	    guifg=navajowhite guibg=NONE    gui=NONE
"hi String       guifg=#e0a5da     guibg=NONE    gui=NONE
hi String       guifg=#b58ecc     guibg=NONE    gui=NONE
hi Statement	guifg=khaki       guibg=NONE    gui=NONE
hi StorageClass guifg=#da8a67     guibg=NONE    gui=NONE
hi Type		    guifg=#75d881  guibg=NONE    gui=NONE
"hi Underlined
hi Ignore	    guifg=grey40

hi Error         guifg=#870000 guibg=#ffa40b gui=NONE
hi Todo		    guifg=orangered     guibg=yellow2
hi TODO          guifg=#ff0087 guibg=#ffff87 gui=NONE

" color terminal definitions
hi NonText	    cterm=bold ctermfg=darkblue
hi Directory	ctermfg=darkcyan
hi ErrorMsg	    cterm=bold ctermfg=7 ctermbg=1
hi IncSearch	cterm=NONE ctermfg=yellow ctermbg=green
hi Search	    cterm=NONE ctermfg=grey ctermbg=blue
hi MoreMsg	    ctermfg=darkgreen
hi ModeMsg	    cterm=NONE ctermfg=brown
hi LineNr	    ctermfg=3
hi Question     ctermfg=green
hi StatusLine   cterm=  bold,reverse
hi StatusLineNC cterm=  reverse
hi VertSplit    cterm=  reverse
hi Title        ctermfg=5
hi Visual       cterm=  reverse
hi VisualNOS    cterm=  bold,underline
hi WarningMsg   ctermfg=1
hi WildMenu     ctermfg=0             ctermbg=3
hi Folded       ctermfg=darkgrey      ctermbg=NONE
hi FoldColumn   ctermfg=darkgrey      ctermbg=NONE
hi DiffAdd      ctermbg=4
hi DiffChange   ctermbg=5
hi DiffDelete   cterm=  bold          ctermfg=4   ctermbg=6
hi DiffText     cterm=  bold          ctermbg=1
hi Comment      ctermfg=darkcyan
hi Constant     ctermfg=brown
hi Special      ctermfg=5
hi Identifier   ctermfg=6
hi Statement    ctermfg=3
hi PreProc      ctermfg=5
hi Todo         ctermfg=red           ctermbg=NONE
hi Type         ctermfg=2
hi Underlined   cterm=  underline     ctermfg=5
hi Ignore       cterm=  bold          ctermfg=7
hi Ignore       ctermfg=darkgrey
hi Error        cterm=  bold          ctermfg=7   ctermbg=1

hi pythonDot                 guifg=#d70a53 guibg=NONE gui=NONE
hi pythonParameters          guifg=#bada55 guibg=NONE gui=NONE
hi pythonClassParameters     guifg=#bada55 guibg=NONE gui=NONE
hi pythonClass               guifg=#00bcbc guibg=NONE gui=NONE
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

"vim: sw=4
