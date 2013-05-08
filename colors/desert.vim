" Vim color file
" Maintainer:	Hans Fugal <hans@fugal.net>
" Last Change:	$Date: 2003/07/24 00:57:11 $
" Last Change:	$Date: 2003/07/24 00:57:11 $
" URL:		http://hans.fugal.net/vim/colors/desert.vim
" Version:	$Id: desert.vim,v 1.7 2003/07/24 00:57:11 fugalh Exp $

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

" highlight groups
hi Cursor       guifg=khaki         guibg=indianred
"hi CursorIM
"hi Directory
hi DiffAdd                          guibg=#575757
hi DiffChange                       guibg=#575757
hi DiffDelete   guifg=black         guibg=#575757
hi DiffText     guifg=#e02222       guibg=#f0e0e0
"hi ErrorMsg
hi VertSplit    guifg=grey50        guibg=#c2bfa5   gui=none
hi Folded       guifg=gold          guibg=grey30        
hi FoldColumn   guifg=tan           guibg=grey30        
hi IncSearch    guifg=slategrey     guibg=khaki
hi LineNr       guifg=gray50        guibg=gray20
hi CursorLine                       guibg=Grey25
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

" syntax highlighting groups
hi Comment	    guifg=SkyBlue
hi Constant	    guifg=#ffa0a0
hi String       guifg=#e0a5da
hi Identifier	guifg=palegreen
hi Statement	guifg=khaki
hi PreProc	    guifg=indianred
hi Type		    guifg=darkkhaki
hi Special	    guifg=navajowhite
"hi Underlined
hi Ignore	    guifg=grey40
"hi Error
hi Todo		    guifg=orangered     guibg=yellow2

" color terminal definitions
hi SpecialKey	ctermfg=darkgreen
hi NonText	    cterm=bold ctermfg=darkblue
hi Directory	ctermfg=darkcyan
hi ErrorMsg	    cterm=bold ctermfg=7 ctermbg=1
hi IncSearch	cterm=NONE ctermfg=yellow ctermbg=green
hi Search	    cterm=NONE ctermfg=grey ctermbg=blue
hi MoreMsg	    ctermfg=darkgreen
hi ModeMsg	    cterm=NONE ctermfg=brown
hi LineNr	    ctermfg=3
"hi CursorLineNr
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

" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

"vim: sw=4
