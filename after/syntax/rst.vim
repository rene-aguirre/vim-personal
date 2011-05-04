" reStructuredText extended syntax, supports embedded
" python code highlighting
" Language:         reStructuredText documentation format
" Maintainer:       
" Latest Revision:  2011-04-29
"
let s:current_syntax=b:current_syntax
unlet b:current_syntax

syntax include @Python syntax/python.vim
syn region rstEmbeddedPython matchgroup=rstDelimiter
      \ start='::\_s*\n\ze\z(\s\+\)' skip='^$' end='^\z1\@!'
      \ contains=@Python

let b:current_syntax=s:current_syntax

