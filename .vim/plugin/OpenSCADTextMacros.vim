"
" This file is for text macro functions specific to OpenSCAD 
"

" General Statements
" ==================
function! OsGenerateModule()
    call append(".", [
                \"module functionName()",
                \"{",
                \"}"])
endfunction

function! OsGenerateFor()
    call append(".", [
                \"for (i=[0:upperBound])",
                \"{",
                \"}"])
endfunction

" Bodies
" ======
function! OsGenerateCube()
    call append(".", "cube([length, width, depth]);")
endfunction

function! OsGenerateCylinder()
    call append(".", "cylinder(r=radius, h=height, $fn=100);")
endfunction

function! OsGenerateSphere()
    call append(".", "sphere(r=radius, $fn=100);")
endfunction

" Transformations
" ===============
function! OsGenerateTranslate()
    call append(".", "translate([0, 0, 0])")
endfunction

function! OsGenerateRotate()
    call append(".", "rotate([0, 0, 0])")
endfunction

function! OsGenerateScale()
    call append(".", "scale([1, 1, 1])")
endfunction

" Spatial Booleans
" ================
function! OsGenerateUnion()
    call append(".", "union()")
endfunction

function! OsGenerateDifference()
    call append(".", "difference()")
endfunction

function! OsGenerateIntersection()
    call append(".", "intersection()")
endfunction
