set nocompatible              " be iMproved, required
filetype off                  " required
set number
set colorcolumn=80
syntax enable
colorscheme monokai
set tabstop=4 shiftwidth=4 expandtab
set nowrap
set laststatus=2

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" Plugins
Plugin 'airblade/vim-gitgutter'
let g:flake8_show_in_file=1
let g:flake8_show_in_gutter=1
let g:flake8_show_quickfix=0
autocmd BufWritePost *.py call Flake8()

Plugin 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = 'git\|ve'

Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

Plugin 'c.vim'
Plugin 'valloric/youcompleteme'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'nvie/vim-flake8'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

