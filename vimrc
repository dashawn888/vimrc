if filereadable("$HOME/.local.vim")
  source $HOME/.local.vim
endif

set nocompatible
filetype plugin indent on
syntax on

if version >= 703
  set autochdir                   " Make the lcd the current dir of file
  set colorcolumn=80
endif

set autowriteall                " Save unsaved buffers when switching to a different buffer.
set backspace=2
set cursorcolumn                " highlight the current column
set cursorline                  " highlight current line
set expandtab
set guioptions-=LlRrBmT
set guioptions+=LlRrBmT
set hlsearch                    " Highlight previous search results
set incsearch
set laststatus=2
set lazyredraw                  " don't redraw screen as macros are running
set list                        " we do what to show tabs, to ensure we get them out of my files
set listchars=tab:>-,trail:-    " show tabs and trailing
set mouse=a
set nobackup
set nohidden                    " don't keep closed tabs, etc open in hidden buffers
set noswapfile
set nowrap
set nowritebackup
set pastetoggle=<F2>
set ruler
set scrolljump=20
set scrolloff=3
set shiftwidth=2
set showcmd
set showmatch
set showmode
set softtabstop=2
set statusline=%t%m%r\ %=0x\%02.2B\ %l,%v
set t_Co=256
set ttyfast
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildmenu wildmode=longest:full

" Ignore case if you search for all lower-case
set ignorecase
set smartcase

colorscheme solarized
set background=dark

" I hate you F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" jj to escape out of insert mode
inoremap jj <ESC>

let mapleader=","
let g:mapleader=","

" Remap arrows to rotating through buffers
nmap <S-left> :bprev<RETURN>
nmap <S-right> :bnext<RETURN>
nmap <C-left> <C-w>h
nmap <C-right> <C-w>l
nmap <C-down> <C-w>j
nmap <C-up> <C-w>k

nnoremap <silent> <F4> :TlistToggle<CR>

let Tlist_Ctags_Cmd="/usr/bin/ctags"
let Tlist_WinWidth=35

map <Leader>ap :set paste<CR>mzgg/"""<CR>no# XXX START PUDB - Inserted automatically.  Use ,P to remove.<CR>import sys<CR>sys.path.append('/home/shlee/src/pudb-2011.3/')<CR>import pudb<CR># XXX END PUDB<C-[>:set nopaste<CR>:let @/ = ""<CR>`z
map <Leader>rp mz/# XXX START PUDB<CR>d/# XXX END PUDB<CR>dd:let @/ = ""<CR>`z
map <Leader>ab opudb.set_trace() # XXX PUDB BREAK<C-[>==
map <Leader>rb mz:g/pudb.set_trace() # XXX PUDB BREAK/d<CR>`z

highlight default link TrailingWhitespace Error

" Use F7 to toggle spellchecking
function ToggleSpellCheck()
  if &spell
    set nospell
  else
    set spell
  endif
endfunction
map <F7> :call ToggleSpellCheck()<CR>
