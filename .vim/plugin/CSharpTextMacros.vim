"
" This file is for text macro functions specific to C#
"

" Logical Statements
" ==================
function! CsGenerateForeach()
    normal! oforeach (var object in collection)
    call GpGenerateReturnBraces()
endfunction

function! CsGenerateFor()
    normal! ofor (int i = 0; i < upperBound; i++)
    call GpGenerateReturnBraces()
endfunction

function! CsGenerateSwitch()
    normal! oswitch (value)
    call GpGenerateReturnBraces()
    normal! Ocase caseOne:
    normal! obreak;
    normal! ocase caseTwo:
    normal! obreak;
    normal! odefault:
    normal! obreak;
endfunction

" Function Structures
" ===================
function! CsGenerateMethodStructure()
    normal! opublic void MethodName
    call GpGenerateMethodEnding()
endfunction

" Comment Structures
" ==================
function! CsGenerateClassComments()
    normal! o//Private Variables
    normal! o//Properties
    normal! o//Constructor
    normal! o//Public Methods
    normal! o//Private Methods
endfunction

function! CsGenerateFullClassComments()
    normal! o//Public Constants
    normal! o//Private Constants
    call CsGenerateClassComments()
endfunction

function! CsGenerateSummaryComment()
    normal! o///<summary>
    normal! o/// 
    normal! o///</summary>
    normal! k$
endfunction
