" Early Conf
set nocompatible
let g:mapleader=","
let mapleader=","

if filereadable(expand("~/.vim.local"))
    source $HOME/.vim.local
endif

if !filereadable(expand("~/.vim/autoload/plug.vim"))
    silent !mkdir -p ~/.vim/autoload
    silent !mkdir -p ~/Source/github.com
    silent !git clone https://github.com/junegunn/vim-plug.git ~/Source/github.com/vim-plug
    silent !cp ~/Source/github.com/vim-plug/plug.vim ~/.vim/autoload/plug.vim
    source $HOME/.vim/autoload/plug.vim
    silent !echo "DATA" > ~/.vim/plug_new_install
endif

" Plugin setup
call plug#begin('~/.vim/plugged')
Plug 'Lokaltog/vim-easymotion'
Plug 'Valloric/YouCompleteMe'
Plug 'altercation/vim-colors-solarized'
Plug 'dhruvasagar/vim-vinegar' " - to open file view.
Plug 'fisadev/vim-isort'
Plug 'kien/rainbow_parentheses.vim'
Plug 'majutsushi/tagbar'       " For python class bar
Plug 'mhinz/vim-signify'       " git integration
Plug 'myusuf3/numbers.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-sensible'
Plug 'vim-scripts/savevers.vim'
Plug 'widox/vim-buffer-explorer-plugin'
call plug#end()

if filereadable(expand("~/.vim/plug_new_install"))
    PlugInstall
    silent !rm ~/.vim/plug_new_install
    q
endif

" Python specific.
au FileType python setl colorcolumn=80
au FileType python TagbarOpen

" Java specific.
au FileType java setl colorcolumn=120

" Bind arrows to python nav
map <Left> [[z<cr>
map <Down> ]mz<cr>
map <Up> [mz<cr>
map <Right> ]]z<cr>

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
set autochdir                   " Make the lcd the current dir of file
set cursorcolumn                " highlight the current column
set cursorline                  " highlight current line
set encoding=utf-8
set expandtab
set guioptions+=LlRrBmT
set guioptions-=LlRrBmT
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
set wildignore=*.swp,*.bak,*.pyc,*.class,*.clean
let g:netrw_list_hide="\.swp$,\.bak$,\.pyc$,\.class$,\.clean$"
syntax on

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

autocmd BufEnter *.py silent :!echo %:p > /tmp/.pycheck.py
autocmd BufWrite *.py silent :!echo %:p > /tmp/.pycheck.py
autocmd BufEnter *.java silent :!echo %:p > /tmp/.javacheck
autocmd BufWrite *.java silent :!echo %:p > /tmp/.javacheck

" Rainbow ([{ all on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Put easymotion back to a single <Leader>
map <Leader> <Plug>(easymotion-prefix)

" YouCompleteMe goto python definition
map <Leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <Leader>d :YcmCompleter GetDoc<CR>

" Settings for vim-scripts/savevers.vim.
silent !mkdir -p ~/.vim_backup
set backup
set patchmode=.clean
let savevers_dirs = "~/.vim_backup"
