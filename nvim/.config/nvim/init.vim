"
" Usage: NeoVim config file
"
" Dotfile by Joris van Dijk | gitlab.com/jorisvandijk 
"
"          Published under GPL-3.0-or-later

" Plugins
set nocompatible              	" be iMproved, required
filetype off                  	" required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'arcticicestudio/nord-vim'
Plugin 'itchyny/lightline.vim'                    

call vundle#end()            	" required
filetype plugin indent on    	" required

" Settings

set t_Co=256                    " Set if term supports 256 colors
set number relativenumber       " Display line numbers
set expandtab                   " Use spaces not tabs
set shiftwidth=4                " One tab for 4 spaces 
set tabstop=4                   " One tab for 4 spaces

" Theme
colorscheme nord

" Lightline
let g:lightline = {'colorscheme': 'nord'}
set laststatus=2                " Always show statusline
