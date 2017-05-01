call plug#begin('~/.config/nvim/plugged')
" look
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
" various
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'othree/javascript-libraries-syntax.vim'

call plug#end()

set termguicolors
let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark
let g:airline_theme='gruvbox'

syntax on
set number
" javascript settings
let g:jsx_ext_required = 0
let g:used_javascript_libs = 'jquery,underscore,react' 

" Toggle nerdtree with F10
map <F10> :NERDTreeToggle<CR>
" Current file in nerdtree
map <F9> :NERDTreeFind<CR>
