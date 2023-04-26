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
    normal! oProperties
    normal! oConstructor
    normal! oPublic Methods
    normal! oPrivate Methods
endfunction

function! CsGenerateFullClassComments()
    normal! o//Public Constants
    normal! oPrivate Constants
    call CsGenerateClassComments()
endfunction

function! CsGenerateUnitTestComments()
    normal! o//Private Constants
    normal! oPrivate Variables
    normal! oSetup
    normal! oTeardown
    normal! oMethods
    normal! oTests
endfunction

function! CsGenerateSummaryComment()
    normal! o///<summary>
    normal! o 
    normal! o</summary>
    normal! k$
endfunction
