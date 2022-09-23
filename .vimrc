source ~/.coc-vimconfig
syntax on
colorscheme slate
filetype plugin on
set nocompatible
set ruler
set showcmd
set guifont=Source_Code_Pro:h12
set nowrap
set shiftwidth=2
set tabstop=2
set expandtab 	" Always use spaces instead of tab char
set autoindent  " copy indent from current line when staring a new line
set showmatch
set smartcase
set incsearch
set ignorecase
set nu
set rnu
"set foldmethod=syntax
set history=1000
set undolevels=1000
set title
set noswapfile
set nobackup
nnoremap ; :
set spell
set noerrorbells
set autochdir
set wildmenu
"Netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
let g:netrw_altv = 1
"augroup ProjectDrawer
	"autocmd!
	"autocmd VimEnter * :Vexplore
"augroup END

let mapleader = " "
"Status line
set statusline=\ %f

nmap <F8> :TagbarToggle<CR>
"Plugin sections
if has('macunix')
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif

"for windows install manually 

"Install plugins
call plug#begin()
"General
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'majutsushi/tagbar' 
"Plug 'vim-scripts/taglist.vim'
"Plug 'multilobyte/gtags-cscope'
"Plug 'zackhsi/fzf-tags'
"Plug 'valloric/youcompleteme'

"Plug 'nathanaelkane/vim-indent-guides'

"Plant uml
Plug 'scrooloose/vim-slumlord'
Plug 'aklt/plantuml-syntax'
"Web Programming
Plug 'mattn/emmet-vim'

"C 
Plug 'vim-scripts/c.vim'

"python
Plug 'python-mode/python-mode'

"Javascript

Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

    
    
"Plug 'pydave/AsyncCommand'
"u
"Plug 'mnick/vim-pomodoro'
call plug#end()
"need to check how to integrate with airline 
"set statusline=%#ErrorMsg#%{PomodoroStatus()}%#StatusLine#


