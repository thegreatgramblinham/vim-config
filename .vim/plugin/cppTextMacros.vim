"
" This file is for text macro functions specific to C++
"

" Logical Statements
" ==================
function! CppGenerateForeach()
    normal! oforeach (&auto object in collection)
    call GpGenerateReturnBraces()
endfunction

function! CppGenerateFor()
    normal! ofor (int i = 0; i < upperBound; i++)
    call GpGenerateReturnBraces()
endfunction

function! CppGenerateSwitch()
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
function! CppGenerateClassStructure()
    normal! oclass ObjectName
    call GpGenerateReturnBraces()
    normal! Opublic:
    normal! o//Public Variables
    normal! oConstructor
    normal! oPublic Methods
    normal! o<BS><BS>private:
    normal! o//Private Variables
    normal! oPrivate Methods
    normal! j$a;
endfunction

function! CppGenerateMethodStructure()
    normal! ovoid methodName
    call GpGenerateMethodEnding()
endfunction

" Comment Structures
" ==================
function! CppGenerateSummaryComment()
    normal! o///<summary>
    normal! o 
    normal! o</summary>
    normal! k$
endfunction

