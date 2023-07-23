"
" This file is for text macro functions that apply to general programming
" purposes.
"

function! GpGenerateMethodEnding()
    call setline('.', getline('.') . "()")
    call GpGenerateReturnBraces()
endfunction

function! GpGenerateReturnBraces()
    normal! o{
    normal! o}
endfunction

function! GpGenerateEndLineBraces()
    normal! A{
    normal! o}
endfunction
