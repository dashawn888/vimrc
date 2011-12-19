set nowrap
set numberwidth=1
set colorcolumn=+1 " Put a print margin
set number

highlight default link TrailingWhitespace Error
augroup filetypedetect
  autocmd WinEnter,BufNewFile,BufRead * match TrailingWhitespace /\s\+$/
augroup END
autocmd InsertEnter * match none
autocmd InsertLeave * match TrailingWhitespace /\s\+$/

if version >= 703
  set colorcolumn=+1
endif

map <buffer> f za
set foldminlines=1
