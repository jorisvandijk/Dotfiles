"
" Usage: NeoVim config file
"
" Dotfile by Joris van Dijk | gitlab.com/jorisvandijk
"
"          Published under GPL-3.0-or-later


set nocompatible              	" be iMproved, required
filetype off                  	" required
filetype plugin indent on    	" required

" Settings
set t_Co=256                    " Set if term supports 256 colors
set number relativenumber       " Display line numbers
set expandtab                   " Use spaces not tabs
set shiftwidth=4                " One tab for 4 spaces
set tabstop=4                   " One tab for 4 spaces
set textwidth=80                " Set max text width
set colorcolumn=+1              " Add column at +1 of text width
set showmatch               	" show matching brackets.
set ignorecase              	" case insensitive matching
set mouse=v                 	" middle-click paste with mouse
set hlsearch                	" highlight search results
set autoindent              	" indent a new line the same amount as the line just typed
set wildmode=longest,list   	" get bash-like tab completions
set cc=80                   	" set an 80 column border for good coding style
filetype plugin indent on   	" allows auto-indenting depending on file type
syntax on                   	" syntax highlighting

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
