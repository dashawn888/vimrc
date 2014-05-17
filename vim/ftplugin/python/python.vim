set nowrap
set numberwidth=1
set number

nmap <f5> :!python -c "import py_compile,sys; sys.stderr=sys.stdout; py_compile.compile(r'%')"<CR>

let g:pydiction_location='~/.vim/pydiction/complete-dict'

let python_highlight_all=1

set foldminlines=1
