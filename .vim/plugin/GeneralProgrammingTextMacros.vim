"
" This file is for text macro functions that apply to general programming
" purposes.
"

function! GpGenerateMethodEnding()
    call setline('.', getline('.') . "()")
    call GpGenerateReturnBraces()
endfunction

function! GpGenerateReturnBraces()
    normal! o
    normal! <<a{
    normal! o
    normal! <<a}
endfunction

function! GpGenerateEndLineBraces()
    normal! $a{
    normal! o
    normal! <<a}
endfunction
