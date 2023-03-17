"
" This file is for text macro functions specific to C#
"

" Logical Statements
" ==================
function! CsGenerateForeach()
    call append(".", [
                \"foreach (var  in collection)",
                \"{",
                \"}"])
endfunction

function! CsGenerateFor()
    call append(".", [
                \"for (int i = 0; i < upperBound; i++)",
                \"{",
                \"}"])
endfunction

function! CsGenerateSwitch()
    call append(".", [
                \"switch (value)",
                \"{",
                \"\tcase caseOne:",
                \"\t\tbreak;",
                \"\tcase caseTwo:",
                \"\t\tbreak;",
                \"\tdefault:",
                \"\t\tbreak;",
                \"}"])
endfunction

" Comment Structures
" ==================
function! CsGenerateClassComments()
    call append(".", [
                \"//Private Variables",
                \"//Properties",
                \"//Constructor",
                \"//Public Methods",
                \"//Private Methods"])
endfunction

function! CsGenerateFullClassComments()
    call append(".", [
                \"//Public Constants",
                \"//Private Constants",
                \"//Private Variables",
                \"//Properties",
                \"//Constructor",
                \"//Public Methods",
                \"//Private Methods"])
endfunction

function! CsGenerateSummaryComment()
    call append(".", [
                \"///<summary>",
                \"///",
                \"///</summary>"])
endfunction
