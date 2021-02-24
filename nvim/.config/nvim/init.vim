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
Plugin 'terryma/vim-smooth-scroll'

call vundle#end()            	" required
filetype plugin indent on    	" required

" Settings
set t_Co=256                    " Set if term supports 256 colors
set number relativenumber       " Display line numbers
set expandtab                   " Use spaces not tabs
set shiftwidth=4                " One tab for 4 spaces
set tabstop=4                   " One tab for 4 spaces
set textwidth=80                " Set max text width
set colorcolumn=+1               " Add column at +1 of text width
" Theme
colorscheme nord

" Lightline
let g:lightline = {'colorscheme': 'nord'}
set laststatus=2                " Always show statusline

" Remapping
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" Remapping to disable arrow keys!
noremap <up>    <nop>
noremap <Down>  <nop>
noremap <Left>  <nop>
noremap <Right> <nop>

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
