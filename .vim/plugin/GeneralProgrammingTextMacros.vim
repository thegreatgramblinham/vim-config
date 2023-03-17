
" This file is for text macro functions that apply to general programming
" purposes.
"

function! GpGenerateMethodEnding()
    call setline('.', getline('.') . "()")
    normal o
    call setline('.', getline('.') . "{")
    normal o
    call setline('.', getline('.') . "}")
    normal O
endfunction
