" __   _(_)_ __ ___        _ __ _   _ _ __  _ __   ___ _ __ ___
" \ \ / / | '_ ` _ \ _____| '__| | | | '_ \| '_ \ / _ \ '__/ __|
"  \ V /| | | | | | |_____| |  | |_| | | | | | | |  __/ |  \__ \
"   \_/ |_|_| |_| |_|     |_|   \__,_|_| |_|_| |_|\___|_|  |___/
"   Run a thing from inside vim real easy like.
"   Make everything feel like a script.

" http://vim.wikia.com/wiki/Letting_variable_values_be_overwritten_in_a_script
" Tries to return the buffer-specific value of a variable; if not
" found, tries to return the global value -- if that's not found
" either, returns an optional default value or -1 if not specified.
function! GetVar( ... )
    let varName=a:1
    if (exists("a:2"))
        let retVal=a:2
    else
        let retVal=-1
    endif
    if (exists ("b:" . varName))
        exe "let retVal=b:" . varName
    elseif (exists ("g:" . varName))
        exe "let retVal=g:" . varName
    endif
    return retVal
endfunction

function! Runners()
    if executable(GetVar("custom_run", 0))
        :command! Run up % | :echo GetVar("custom_run") | :execute "Shell " . GetVar("custom_run")
    elseif (&ft=='ruby')
        :command! Run up % | Shell ruby %
    elseif (&ft=='python')
        command! Run up % | Shell python %
    elseif (&ft=='php')
        :command! Run up % | !php %
    elseif (&ft=='javascript' || &ft=='javascript.jsx')
        :command! Run up % | Shell node %
    elseif (&ft=='typescript')
        :command! Run up % | Shell ts-node %
    elseif (&ft=='ocaml')
        :command! Run up % | Shell ocaml %
    elseif (&ft=='sh')
        :command! Run up % | Shell bash %
    elseif (&ft=='c')
        command! Run up % | execute "Shell " . GetVar("cc", "cc") . " "
                    \ . GetVar("cc_flags",
                        \ system("paste -s -d ' ' compile_flags.txt 2>/dev/null || echo '-std=c11 -Wall -Werror'"))
                    \ . " % -o vrun.out && ./vrun.out && rm vrun.out"
    elseif (&ft=='cpp')
        command! Run up % | execute "Shell " . GetVar("cxx", "c++") . " "
                    \ . GetVar("cxx_flags", 
                        \ system("paste -s -d ' ' compile_flags.txt 2>/dev/null || echo '-std=c++17 -Wall -Werror'"))
                    \ . " % -o vrun.out && ./vrun.out && rm vrun.out"
    elseif ((&ft=='rust') && filereadable("./Cargo.toml"))
        " Cargo managed project
        if (filereadable("./src/main.rs"))
            command! Run up % | :Shell cargo run
        else
            command! Run up % | :Shell cargo run --bin %:t:r
        endif
    elseif (&ft=='rust')
        " if outside of a project, just compile temporarily with rustc
        :command! Run up % | :Shell rustc % -o vrun.out && ./vrun.out && rm vrun.out
    elseif (&ft=='scala')
        :command! Run up % | !scala %
    elseif (&ft=='swift')
        :command! Run up % | !swift %
    elseif (&ft=='go')
        :command! Run up % | !go run %
    elseif (&ft=='vim')
        " how could I have forgotten?
        :command! Run up % | source %
    elseif (&ft=='zig')
        :command! Run up % | :Shell zig test %

    " Stuff you probably don't need:
    elseif (&ft=='chuck')
        " Chuck is an awesome music language!
        :command! Run up % | !chuck %
    elseif (&ft=='markdown')
        " Who actually used the original markdown perl script anymore anyway?
        :command! Run up % | !markdown %

    " lol lisp
    elseif (&ft=='lisp')
        :command! Run up % | !clisp %
    elseif (&ft=='scheme')
        " relies on Petite Chez Scheme, an interpreted version of Chez Scheme.
        :command! Run up % | !petite --script %
    elseif (&ft=='sild')
        :command! Run up % | !sild %

    elseif (&ft=='haskell')
        " I've never even written haskell why is this even here.
        :command! Run up % | !runhaskell %

    else
        :command! Run echo 'Interpreter unavailable'
    endif

endfunction

" On entry into a buffer, Runners() is called to redefine `Run` to refer to
" the appropriate command.
:autocmd BufEnter * :call Runners()
