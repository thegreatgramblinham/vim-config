"
" This file is for text macro functions specific to C
"

" Logical Statements
" ==================
function! CGenerateFor()
    normal! ofor (int i = 0; i < upperBound; i++)
    call GpGenerateReturnBraces()
endfunction

function! CGenerateSwitch()
    normal! oswitch (intValue)
    call GpGenerateReturnBraces()
    normal! Ocase caseOne:
    normal! obreak;
    normal! ocase caseTwo:
    normal! obreak;
    normal! odefault:
    normal! obreak;
endfunction

" Function Structures
" ===============
function! CGenerateFunctionStructure()
    normal! ovoid methodName(void)
    call GpGenerateReturnBraces()
endfunction

" Comment Structures
" ==================
function! CGenerateSourceFileComment()
    normal! o///Imports
    normal! oStatic Global Variables
    normal! oLocal Definitions
    normal! oStatic Functions
    normal! oExtern Functions
endfunction

function! CGenerateHeaderFileComment()
    normal! o#ifndef HEADER_FILE_H
    normal! o#define HEADER_FILE_H
    normal! o#endif
    normal! j
    normal! o///Imports
    normal! oFunction Definitions
endfunction