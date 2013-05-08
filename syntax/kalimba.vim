" Vim syntax file
" Language:	CSR Kalimba Assembler
" Author:	Rene Aguirre
" Last change:	2009 May 12
"
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

" setlocal iskeyword+=.

" Partial list of register symbols
syn keyword kalimbaReg      null rmac r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 rlink rflags rintlink
syn keyword kalimbaReg      i0 i1 i2 i3 i4 i5 i6 i7 m0 m1 m2 m3 l0 l1 l4 l5
syn keyword kalimbaReg      rmac0 rmac1 rmac2 rmac12
syn keyword kalimbaReg      doloopstart doloopend divresult divremainder

syn match kalimbaOperator	"\<z\>"
syn match kalimbaOperator	"\<nz\>"
syn match kalimbaOperator	"\<c\>"
syn match kalimbaOperator	"\<nc\>"
syn match kalimbaOperator	"\<neg\>"
syn match kalimbaOperator	"\<pos\>"
syn match kalimbaOperator	"\<v\>"
syn match kalimbaOperator	"\<nv\>"
syn match kalimbaOperator	"\<ls\>"
syn match kalimbaOperator	"\<ge\>"
syn match kalimbaOperator	"\<lt\>"
syn match kalimbaOperator	"\<gt\>"
syn match kalimbaOperator	"\<le\>"
syn match kalimbaOperator	"\<userdef\>"

syn match kalimbaOpcode         "^\s*\<if\>"
syn match kalimbaOpcode         "\<jump\>"
syn match kalimbaOpcode         "\<call\>"
syn match kalimbaOpcode         "\<rts\>"

" Valid labels
syn match kalimbaLabel		"^\s*$?[a-z][a-z0-9_.]*:"he=e-1

" Various number formats
syn match hexNumber		"0x[0-9a-fA-F]\+\>"
syn match binNumber		"0b[01]\+\>"
syn match decNumber		"\<[0-9]\+D\=\>"
syn match floatE		"_*e_*" contained
syn match floatExponent		"_*e_*[-+]\=[0-9]\+" contained contains=floatE
syn match floatNumber		"[-+]\=[0-9]\+_*E_*[-+]\=[0-9]\+" contains=floatExponent
syn match floatNumber		"[-+]\=[0-9]\+\.[0-9]\+\(E[-+]\=[0-9]\+\)\=" contains=floatExponent

" Immediate data
syn match kalimbaSymbol		"[a-z][a-z0-9_.]*" contained
syn match kalimbaGlobal	        "$[a-z][a-z0-9_.]*" contains=kalimbaSymbol

" Comments
syn keyword kalimbaTodo NOTE TODO XXX contained
syn match kalimbaComment	"//.*" contains=kalimbaTodo
if exists("kalimba_no_comment_fold")
  syn region	kalimbaComment	matchgroup=cCommentStart start="/\*" end="\*/" contains=kalimbaTodo extend
else
  syn region	kalimbaComment	matchgroup=cCommentStart start="/\*" end="\*/" contains=kalimbaTodo fold extend
endif
" Include
syn match kalimbaInclude		"^\s*\(\.\|#\)\<include\>"

syn match kalimbaRepeat	        "\<do\>"

" Directives
syn match kalimbaDirective      "\.\<BLOCK\>"
syn match kalimbaDirective      "\.\<ENDBLOCK\>"
syn match kalimbaDirective      "\.\<MODULE\>"
syn match kalimbaDirective      "\.\<ENDMODULE\>"
syn match kalimbaDirective      "\.\<VAR\>"
syn match kalimbaDirective      "\.\<CONST\>"

" Conditional assembly
syn match kalimbaPreCond		"^\s*\(\.\|#\)\<IF\>"
syn match kalimbaPreCond		"^\s*\(\.\|#\)\<IFDEF\>"
syn match kalimbaPreCond		"^\s*\(\.\|#\)\<IFNDEF\>"
syn match kalimbaPreCond		"^\s*\(\.\|#\)\<ELIF\>"
syn match kalimbaPreCond		"^\s*\(\.\|#\)\<ELSE\>"
syn match kalimbaPreCond		"^\s*\(\.\|#\)\<ENDIF\>"
syn match kalimbaPreCond		"^\s*\(\.\|#\)\<DEFINE\>"

syn case match

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_kalimba_syntax_inits")
  if version < 508
    let did_kalimba_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  " The default methods for highlighting.  Can be overridden later
  " Comment Constant Error Identifier PreProc Special Statement Todo Type
  "
  " Constant		Boolean Character Number String
  " Identifier		Function
  " PreProc		Define Include Macro PreCondit
  " Special		Debug Delimiter SpecialChar SpecialComment Tag
  " Statement		Conditional Exception Keyword Label Operator Repeat
  " Type		StorageClass Structure Typedef

  HiLink kalimbaComment		Comment
  HiLink kalimbaTodo		Todo

  HiLink hexNumber		Number		" Constant
  HiLink binNumber		Number		" Constant
  HiLink decNumber		Number		" Constant
  HiLink floatNumber		Number		" Constant
  HiLink floatExponent		Number		" Constant
  HiLink floatE			SpecialChar	" Statement
  "HiLink floatE		Number		" Constant

  HiLink kalimbaSymbol		Constant
  HiLink kalimbaGlobal          Special

  HiLink kalimbaString		String		" Constant
  " HiLink kalimbaCharError	Error
  " HiLink kalimbaStringError	Error

  HiLink kalimbaReg		Identifier
  HiLink kalimbaOperator	Identifier

  HiLink kalimbaInclude		Include		" PreProc
  " HiLink kalimbaMacro		Macro		" PreProc
  " HiLink kalimbaMacroParam	Keyword		" Statement

  HiLink kalimbaDirective	Type
  HiLink kalimbaPreCond		Special

  HiLink kalimbaOpcode		Statement
  " HiLink kalimbaCond		Conditional	" Statement
  HiLink kalimbaRepeat		Repeat		" Statement

  HiLink kalimbaLabel		Label
  delcommand HiLink
endif

let b:current_syntax = "kalimba"

" vim: ts=8 sw=2
