function ToggleSpellCheck()
  if &spell
    set nospell
  else
    set spell
  endif
endfunction

if filereadable("$HOME/.local.vim")
  source $HOME/.local.vim
endif

if version >= 703
  set autochdir                   " Make the lcd the current dir of file
  set colorcolumn=80
endif

if has("gui_running")
  set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
endif

colorscheme solarized
" colorscheme torte
filetype plugin indent on
highlight default link TrailingWhitespace Error
inoremap <F1> <ESC>
inoremap jj <ESC>
let g:mapleader=","
let mapleader=","
map <Leader>ab opudb.set_trace() # XXX PUDB BREAK<C-[>==
map <Leader>ap :set paste<CR>mzggO# XXX START PUDB - Inserted automatically.  Use ,P to remove.<CR>import pudb<CR># XXX END PUDB<C-[>:set nopaste<CR>:let @/ = ""<CR>`z
map <Leader>m :set modifiable<CR>
map <Leader>rb mz:g/pudb.set_trace() # XXX PUDB BREAK/d<CR>`z
map <Leader>rp mz/# XXX START PUDB<CR>d/# XXX END PUDB<CR>dd:let @/ = ""<CR>`z
nnoremap <F1> <ESC>
set autowriteall                " Save unsaved buffers when switching to a different buffer.
set background=dark
set backspace=2
set cursorcolumn                " highlight the current column
set cursorline                  " highlight current line
set expandtab
set guioptions-=LlRrBmT
set guioptions+=LlRrBmT
set hlsearch                    " Highlight previous search results
set ignorecase
set incsearch
set laststatus=2
set lazyredraw                  " don't redraw screen as macros are running
set listchars=tab:>-,trail:-    " show tabs and trailing
set list                        " we do what to show tabs, to ensure we get them out of my files
set mouse=a
set nobackup
set nocompatible
set nohidden                    " don't keep closed tabs, etc open in hidden buffers
set noswapfile
set nowrap
set nowritebackup
set pastetoggle=<F2>
set ruler
set scrolljump=20
set scrolloff=3
set shiftwidth=4
set showcmd
set showmatch
set showmode
set smartcase
set softtabstop=4
set statusline=%t%m%r\ %=0x\%02.2B\ %l,%v
set t_Co=256
set ttyfast
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildmenu wildmode=longest:full
syntax on
vnoremap <F1> <ESC>
map <F7> :call ToggleSpellCheck()<CR>
if exists("$TMUX")
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
