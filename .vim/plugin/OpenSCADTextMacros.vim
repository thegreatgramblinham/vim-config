"
" This file is for text macro functions specific to OpenSCAD 
"

" General Statements
" ==================
function! OsGenerateModule()
    normal! omodule functionName
    call GpGenerateMethodEnding()
endfunction

function! OsGenerateFor()
    normal! ofor (i=[0:upperBound])
    call GpGenerateReturnBraces()
endfunction

" Bodies
" ======
function! OsGenerateCube()
    normal! ocube([length, width, depth]);
endfunction

function! OsGenerateCylinder()
    normal! ocylinder(r=radius, h=height, $fn=100);
endfunction

function! OsGenerateSphere()
    normal! osphere(r=radius, $fn=100);
endfunction

" Transformations
" ===============
function! OsGenerateTranslate()
    normal! otranslate([0, 0, 0])
endfunction

function! OsGenerateRotate()
    normal! orotate([0, 0, 0])
endfunction

function! OsGenerateScale()
    normal! oscale([1, 1, 1])
endfunction

" Spatial Booleans
" ================
function! OsGenerateUnion()
    normal! ounion()
endfunction

function! OsGenerateDifference()
    normal! odifference()
endfunction

function! OsGenerateIntersection()
    normal! ointersection()
endfunction
