" Vim syntax file
" Language:	PSR pskey configuration syntax
" Author:	Rene Aguirre
" Last change:	Dec-12-2010
"
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

syn keyword	cTodo		contained TODO FIXME XXX
" cCommentGroup allows adding matches for special things in comments
syn cluster	cCommentGroup	contains=cTodo
syn match	cCommentL	"\/\/.*$" contains=@cCommentGroup,@Spell
" Main syntax 
syn match       psrAddress          "\(&\|?\)[0-9a-fA-F]\+\>" contained
syn match       psrPayload          "=\s*\<\([0-9a-fA-F]\+\s*\)\+\>"ms=s+1 contained nextgroup=cCommentL
syn match       psrSetting          "^\s*&.*=.*$" contains=psrAddress,psrPayload,cCommentL
syn match       psrDelete           "^\s*&.*-.*" contains=psrAddress nextgroup=cCommentL,skipwhite
syn match       psrQuery            "^\s*?.*=.*$" contains=psrAddress,cCommentL

" Pre-Processor stuff
syn region      cPreCondit      start="^\s*\(%:\|#\)\s*\(if\|ifdef\|ifndef\|elif\)\>" skip="\\$" end="$"  keepend contains=cCommentL
syn match	cPreCondit	display "^\s*\(%:\|#\)\s*\(else\|endif\)\>"
if !exists("c_no_if0")
  if !exists("c_no_if0_fold")
    syn region	cCppOut		start="^\s*\(%:\|#\)\s*if\s\+0\+\>" end=".\@=\|$" contains=cCppOut2 fold
  else
    syn region	cCppOut		start="^\s*\(%:\|#\)\s*if\s\+0\+\>" end=".\@=\|$" contains=cCppOut2
  endif
  syn region	cCppOut2	contained start="0" end="^\s*\(%:\|#\)\s*\(endif\>\|else\>\|elif\>\)" contains=cSpaceError,cCppSkip
  syn region	cCppSkip	contained start="^\s*\(%:\|#\)\s*\(if\>\|ifdef\>\|ifndef\>\)" skip="\\$" end="^\s*\(%:\|#\)\s*endif\>" contains=cSpaceError,cCppSkip
endif
syn region	cIncluded	display contained start=+"+ skip=+\\\\\|\\"+ end=+"+
syn match	cIncluded	display contained "<[^>]*>"
syn match	cInclude	display "^\s*\(%:\|#\)\s*include\>\s*["<]" contains=cIncluded
"syn match cLineSkip	"\\$"
syn cluster	cPreProcGroup	contains=cPreCondit,cIncluded,cInclude,cDefine,cCppOut,cCppOut2,cCppSkip,@cCommentGroup
syn region	cDefine		start="^\s*\(%:\|#\)\s*\(define\|undef\)\>" skip="\\$" end="$" keepend contains=ALLBUT,@cPreProcGroup,@Spell
syn region	cPreProc	start="^\s*\(%:\|#\)\s*\(pragma\>\|line\>\|warning\>\|warn\>\|error\>\)" skip="\\$" end="$" keepend contains=ALLBUT,@cPreProcGroup,@Spell

syn match	cSpecial	display contained "\\\(x\x\+\|\o\{1,3}\|.\|$\)"
syn region	cString		contained start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=cSpecial,@Spell

syn case ignore

hi def link psrAddress          Statement
hi def link psrPayload          Constant

hi def link cTodo               Todo
hi def link cPreProc		PreProc
hi def link cDefine		Macro
hi def link cInclude		Include
hi def link cIncluded		String
hi def link cCppSkip		cCppOut
hi def link cCppOut2		cCppOut
hi def link cCppOut		Comment
hi def link cCommentL		Comment
hi def link cPreCondit		PreCondit
hi def link cSpecial		SpecialChar


let b:current_syntax = "psr"

" vim: ts=8 sw=2
