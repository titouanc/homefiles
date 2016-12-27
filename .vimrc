set nocompatible              " be iMproved, required
syntax enable
colorscheme monokai
filetype off                  " required

set number
set colorcolumn=80
set tabstop=4 shiftwidth=4 expandtab
set nowrap
set laststatus=2

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" Plugins
Plugin 'airblade/vim-gitgutter'

Plugin 'nvie/vim-flake8'
let g:flake8_show_in_file=1
let g:flake8_show_in_gutter=1
let g:flake8_show_quickfix=0
autocmd BufWritePost *.py call Flake8()

Plugin 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = '.git\|ve\|node_modules'

Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

Plugin 'c.vim'

Plugin 'valloric/youcompleteme'

Plugin 'terryma/vim-multiple-cursors'

Plugin 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='sol'


Plugin 'scrooloose/nerdtree'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nmap <C-Tab> :NERDTreeToggle

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

