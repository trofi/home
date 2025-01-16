" Load various defaults:
" - syntax highlighting,
" - language dependent indentation
" - last position autosave
silent! source $VIMRUNTIME/defaults.vim

colorscheme darkblue
" default color is invisible blue-on-blue
highlight MatchParen ctermbg=green

set ruler

set encoding=utf-8
set fenc=utf-8
set fencs=utf-8,koi8-r

" just maintain the indent
set autoindent

" copy the indentation style from previous line
set copyindent

" do preserve tab/space mix on change
set preserveindent

" use 4 spaces for indent
set shiftwidth=4

" always render tabs even if a single file is open
set showtabline=2

" always render status line below
set laststatus=2

" render line number column (and do it with with a different color)
set number
highlight LineNr ctermbg=darkgray guibg=darkgray

set list
set listchars=tab:<->,trail:.

" show preferred boundary
set colorcolumn=73

" keep latest search highlighted
set hlsearch
highlight ColorColumn ctermbg=darkgray guibg=darkgray

" vim enables xterm-style Ctrl-<arrows> keys based on $TERM variable
" name. term=screen-256color does not trigger it. Let's work it around
" by clobbering it.
if !has('nvim')
    " nvim does not have 'term' attribute
    set term=xterm-256color
endif

" allow :find to do subdirectry search and use globs for search
set path+=**

let g:netrw_banner=0 " avoid big banner
let g:netrw_liststyle=3 " tree view

" Emacs-style window scroll 1 line up and down
:map <C-Up> <C-y>
:map <C-Down> <C-e>

" spelling configuration
setlocal spelllang=en_gb,ru
