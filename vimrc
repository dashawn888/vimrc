" Early Conf
set nocompatible
let g:mapleader=","
let mapleader=","

if filereadable(expand("~/.vim.local"))
  source $HOME/.vim.local
endif

if !filereadable(expand("~/.vim/autoload/plug.vim"))
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  source $HOME/.vim/autoload/plug.vim
  silent !echo "DATA" > ~/.vim/plug_new_install
endif

" Plugin setup
call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'nvie/vim-flake8'
Plug 'rkulla/pydiction'
Plug 'scrooloose/syntastic'
Plug 'widox/vim-buffer-explorer-plugin'
Plug 'mattn/flappyvird-vim'
call plug#end()

if filereadable(expand("~/.vim/plug_new_install"))
    PlugInstall
    silent !rm ~/.vim/plug_new_install
    q
endif

if !exists("*ToggleSpellCheck")
    function ToggleSpellCheck()
      if &spell
        set nospell
      else
        set spell
      endif
    endfunction
endif
map <F7> :call ToggleSpellCheck()<CR>


set autochdir                   " Make the lcd the current dir of file
set colorcolumn=80

" Bind ctrl+hjkl to move around windows.
map <Left> <c-w>h
map <Down> <c-w>j
map <Up> <c-w>k
map <Right> <c-w>l

" Between tabs.
map <Leader>tp :tabprevious<CR>
map <Leader>tn :tabnext<CR>
map <Leader>tc :tabnew<CR>

" Clear search and other search settings.
set hlsearch                    " Highlight previous search results
set ignorecase
set incsearch

" No F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

set autowriteall                " Save unsaved buffers when switching to a different buffer.

" jj to stop typing in text.
inoremap jj <ESC>:w<CR>

" Pudb setup.
map <Leader>ab opudb.set_trace() # XXX PUDB BREAK<C-[>==

map <Leader>ap :set paste<CR>mzggO# XXX START PUDB - Inserted automatically.  Use ,P to remove.<CR>import pudb<CR># XXX END PUDB<C-[>:set nopaste<CR>:let @/ = ""<CR>`z
map <Leader>m :set modifiable<CR>
map <Leader>rb mz:g/pudb.set_trace() # XXX PUDB BREAK/d<CR>`z
map <Leader>rp mz/# XXX START PUDB<CR>d/# XXX END PUDB<CR>dd:let @/ = ""<CR>`z

" Setup color
colorscheme solarized
set background=dark
set t_Co=256  " For a better colorscheme.

filetype plugin indent on
highlight default link TrailingWhitespace Error
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
set number
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
" set statusline=%t%m%r\ %=0x\%02.2B\ %l,%v
set ttyfast
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildmenu wildmode=longest:full
syntax on

" If we are using tmux add the extra cmds to get the cursor right.
if exists("$TMUX")
    let &t_SI = "\<ESC>Ptmux;\<ESC>\<ESC>]50;CursorShape=1\x7\<ESC>\\"
    let &t_EI = "\<ESC>Ptmux;\<ESC>\<ESC>]50;CursorShape=0\x7\<ESC>\\"
else
    let &t_SI = "\<ESC>]50;CursorShape=1\x7"
    let &t_EI = "\<ESC>]50;CursorShape=0\x7"
endif

nmap <F3> :set list!<CR>

" Airline setup
" let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = '%{getcwd()}'
let g:airline_left_sep='>'
let g:airline_right_sep='<'
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_iminsert=0
let g:airline_inactive_collapse=1

" Cdiff hook
map <Leader>d :!cdiff -ls %<CR>

