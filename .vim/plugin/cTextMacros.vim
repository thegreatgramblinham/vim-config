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

" Functions and Structures
" ===============
function! CGenerateStructTemplate()
    normal ostruct struct_type_s
    call GpGenerateReturnBraces()
    normal a;
endfunction

function! CGenerateFunctionTemplate()
    normal! ovoid functionName(void)
    call GpGenerateReturnBraces()
endfunction

" Comment Structures
" ==================
function! CGenerateSourceFileComment()
    normal! o///Imports
    normal! oLocal Declarations
    normal! oStatic Constants
    normal! oStatic Global Variables
    normal! oStatic Functions
    normal! oExtern Functions
endfunction

function! CGenerateHeaderFileComment()
    normal! o#ifndef HEADER_FILE_H
    normal! o#define HEADER_FILE_H
    normal! o#endif
    normal! O///Imports
    normal! oType Declarations
    normal! oConstants
    normal! oFunction Declarations
endfunction
