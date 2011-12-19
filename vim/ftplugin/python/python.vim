set nowrap
set numberwidth=1
set number

" set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
" set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
" nmap <f5> :make %<RETURN>
nmap <f5> :!python -c "import py_compile,sys; sys.stderr=sys.stdout; py_compile.compile(r'%')"<CR>

let g:pydiction_location='~/.vim/pydiction/complete-dict'

let python_highlight_all=1

" highlight default link TrailingWhitespace Error
" augroup filetypedetect
"   autocmd WinEnter,BufNewFile,BufRead * match TrailingWhitespace /\s\+$/
" augroup END
" autocmd InsertEnter * match none
" autocmd InsertLeave * match TrailingWhitespace /\s\+$/

if version >= 703
  set colorcolumn=+1
endif

set foldminlines=1
