set nocompatible
set number
set ignorecase
set mouse=v
set hlsearch
set tabstop=2
set autoindent
syntax on
set mouse=a
" set smartindent
filetype plugin on

call plug#begin("~/.vim/plugged")
Plug 'dracula/vim'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'windwp/nvim-autopairs'
" coc for tslinting, auto complete and prettier
Plug 'neoclide/coc.nvim', {'branch' : 'release'}
call plug#end()
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']


