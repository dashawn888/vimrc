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
Plug 'davidhalter/jedi-vim'
Plug 'dhruvasagar/vim-vinegar'
Plug 'kien/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'mattn/flappyvird-vim'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'myusuf3/numbers.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'widox/vim-buffer-explorer-plugin'
Plug 'yegappan/mru'
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

" Setup color
colorscheme solarized
set background=dark
set t_Co=256  " For a better colorscheme.

filetype plugin indent on
highlight default link TrailingWhitespace Error
set autowriteall                " Save unsaved buffers when switching to a different buffer.
set cursorcolumn                " highlight the current column
set cursorline                  " highlight current line
set expandtab
set guioptions-=LlRrBmT
set guioptions+=LlRrBmT
set lazyredraw                  " don't redraw screen as macros are running
set list                        " we do what to show tabs, to ensure we get them out of my files
set mouse=a
set nobackup
set nohidden                    " don't keep closed tabs, etc open in hidden buffers
set noswapfile
set nowrap
set nowritebackup
set number
set pastetoggle=<F2>
set scrolljump=20
set scrolloff=3
set shiftwidth=4
set showmatch
set showmode
set smartcase
set softtabstop=4
set ttyfast
set wildignore=*.swp,*.bak,*.pyc,*.class
syntax on

" If we are using tmux add the extra cmds to get the cursor right.
if exists("$TMUX")
    let &t_SI = "\<ESC>Ptmux;\<ESC>\<ESC>]50;CursorShape=1\x7\<ESC>\\"
    let &t_EI = "\<ESC>Ptmux;\<ESC>\<ESC>]50;CursorShape=0\x7\<ESC>\\"
else
    let &t_SI = "\<ESC>]50;CursorShape=1\x7"
    let &t_EI = "\<ESC>]50;CursorShape=0\x7"
endif

autocmd BufEnter *.py silent :!echo %:p > /tmp/.pycheck.py
autocmd BufWrite *.py silent :!echo %:p > /tmp/.pycheck.py

" Rainbow ([{ all on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Put easymotion back to a single <Leader>
map <Leader> <Plug>(easymotion-prefix)
