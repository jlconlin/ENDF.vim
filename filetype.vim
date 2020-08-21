if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
    " Recognize ENDF files
    au BufRead,BufNewFile *.endf,*.rendf, *.pendf setfiletype endf
augroup END
