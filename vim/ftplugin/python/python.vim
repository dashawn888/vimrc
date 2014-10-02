set nowrap
set numberwidth=1
set number

nmap <f5> :!python -c "import py_compile,sys; sys.stderr=sys.stdout; py_compile.compile(r'%')"<CR>

let g:pydiction_location='~/.vim/pydiction/complete-dict'

let python_highlight_all=1

set foldminlines=1

nmap <Leader>pba opudb.set_trace() # XXX PUDB BREAK<C-[>==
nmap <Leader>pbr mz:g/pudb.set_trace() # XXX PUDB BREAK/d<CR>`z
nmap <Leader>pa :set paste<CR>mzggO# XXX START PUDB - Inserted automatically.  Use ,P to remove.<CR>import pudb<CR># XXX END PUDB<C-[>:set nopaste<CR>:let @/ = ""<CR>`z
nmap <Leader>pr mz/# XXX START PUDB<CR>d/# XXX END PUDB<CR>dd:let @/ = ""<CR>`z
