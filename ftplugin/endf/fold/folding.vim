" ViM folding file for ENDF type files
" Language: Evaluated Nuclear Data File (ENDF)
" Maintainer: Jeremy Lloyd Conlin (jlconlin@me.com)
" Latest Revision: 27 March 2014

setlocal foldmethod=expr
setlocal foldexpr=ENDFFolds()
setlocal foldtext=ENDFFoldText()

let g:current_line = ''
let g:current_mat = 0
let g:current_mf = 0
let g:current_mt = 0

" This function is executed for every line to determine the fold level
function! ENDFFolds()
    " Get the current line
    let line = getline(v:lnum)

    let g:previous_mat = g:current_mat
    let g:current_mat = str2nr(strpart(line, 67,3))

    let g:previous_mf = g:current_mf
    let g:current_mf = str2nr(strpart(line, 70, 2))

    let g:previous_mt = g:current_mt
    let g:current_mt = str2nr(strpart(line, 72, 3))

    if g:previous_mat == 0
        let g:current_mf = 0
        return '>1'
    elseif g:previous_mf == 0
        let g:current_mt = 0
        return '>2'
    else
        if g:previous_mt == 0
            return ">3"
        else
            return "="
        endif
    endif
endfunction

function! ENDFFoldText()
    let foldsize = (v:foldend-v:foldstart)

    let line = getline(v:foldstart)
    let MAT = strpart(line, 66, 4)
    let MF = strpart(line, 70, 2)
    let MT = strpart(line, 72, 3)

    return 'MAT='.MAT.' MF='.MF.' MT='.MT.' '.' ('.foldsize.' lines)'
endfunction
