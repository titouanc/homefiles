set nocompatible              " be iMproved, required
filetype off                  " required
set number
syntax enable
colorscheme monokai
set tabstop=4 shiftwidth=4 expandtab


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'nvie/vim-flake8'
Plugin 'airblade/vim-gitgutter'


" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

