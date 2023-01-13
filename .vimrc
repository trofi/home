" Begin .vimrc

" Load various defaults:
" - syntax highlightling,
" - language dependent indentation
" - last position autosave
silent! source $VIMRUNTIME/defaults.vim

colorscheme darkblue
set ruler

set encoding=utf-8
set fenc=utf-8
set fencs=utf-8,koi8-r

" just maintain the indent
set autoindent

" use 4 spaces for indent
set shiftwidth=4

" always render tabs even if a single file is open
set showtabline=2

" do not insert tabs unless requested
set expandtab

set list
set listchars=tab:<->,trail:.

" show preferred boundary
set colorcolumn=72

" keep latest search highlighted
set hlsearch
highlight ColorColumn ctermbg=darkgray guibg=darkgray

" End .vimrc
