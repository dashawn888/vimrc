set nocompatible
function ToggleSpellCheck()
  if &spell
    set nospell
  else
    set spell
  endif
endfunction
map <F7> :call ToggleSpellCheck()<CR>

if filereadable("$HOME/.local.vim")
  source $HOME/.local.vim
endif

if version >= 703
  set autochdir                   " Make the lcd the current dir of file
  set colorcolumn=80
endif

" Bind ctrl+hjkl to move around windows.
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Between tabs.
map <c-p> <esc>:tabprevious<CR>
map <c-n> <esc>:tabnext<CR>
map <c-t> <esc>:tabnew<CR>

" Clear search and other search settings.
noremap <Leader>c :nohl<CR>
vnoremap <Leader>c :nohl<CR>
inoremap <Leader>c :nohl<CR>
set hlsearch                    " Highlight previous search results
set ignorecase
set incsearch

" No F1
inoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap <F1> <ESC>

" jj to stop typing in text.
inoremap jj <ESC>

" Pudb setup.
map <Leader>ab opudb.set_trace() # XXX PUDB BREAK<C-[>==
map <Leader>ap :set paste<CR>mzggO# XXX START PUDB - Inserted automatically.  Use ,P to remove.<CR>import pudb<CR># XXX END PUDB<C-[>:set nopaste<CR>:let @/ = ""<CR>`z
map <Leader>m :set modifiable<CR>
map <Leader>rb mz:g/pudb.set_trace() # XXX PUDB BREAK/d<CR>`z
map <Leader>rp mz/# XXX START PUDB<CR>d/# XXX END PUDB<CR>dd:let @/ = ""<CR>`z

colorscheme solarized
set background=dark
set t_Co=256  " For a better colorscheme.

filetype plugin indent on
highlight default link TrailingWhitespace Error
let g:mapleader=","
let mapleader=","
set autowriteall                " Save unsaved buffers when switching to a different buffer.
set backspace=2
set cursorcolumn                " highlight the current column
set cursorline                  " highlight current line
set expandtab
set guioptions-=LlRrBmT
set guioptions+=LlRrBmT
set laststatus=2
set lazyredraw                  " don't redraw screen as macros are running
set listchars=tab:>-,trail:-    " show tabs and trailing
set list                        " we do what to show tabs, to ensure we get them out of my files
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
set shiftwidth=4
set showcmd
set showmatch
set showmode
set smartcase
set softtabstop=4
set statusline=%t%m%r\ %=0x\%02.2B\ %l,%v
set ttyfast
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildmenu wildmode=longest:full
syntax on

" If we are using tmux add the extra cmds to get the cursor right.
if exists("$TMUX")
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
