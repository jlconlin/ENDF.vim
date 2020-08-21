" Vim syntax file
" Language: Evaluated Nuclear Data File (ENDF)
" Maintainer: Jeremy Lloyd Conlin (jlconlin@me.com)
" Latest Revision: 27 March 2014

if exists("b:current_syntax")
    finish
endif

" Regions
" Data
syn region Normal start="\%1c" end="\%67c"
" Material 
syn region string start="\%67c" end="\%71c"
" MF region
syn region Statement start="\%71c" end="\%73c"
" MT region
syn region constant start="\%73c" end="\%76c"
