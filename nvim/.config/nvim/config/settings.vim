" UI {{{
set termguicolors
colorscheme night-owl
set noshowmode " hide mode indicator
set cursorline " highlight current line
set number relativenumber " set relative line numbers
set list listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:· " show invisibles
set splitbelow splitright " more intuitive vertical and horizontal splits
set autowriteall " save buffers as often as possible
set hidden " allow hiding modified buffers
set undofile " persistent undo
set clipboard^=unnamed " use system clipboard
set scrolloff=15
set cmdheight=2
set shortmess+=c
set updatetime=300
set signcolumn=yes
" }}}

" for coc.nvim
set nobackup
set nowritebackup

" Indentation {{{
set shiftwidth=2
set softtabstop=2
set expandtab
set foldmethod=syntax
set foldlevel=999
" }}}

" Search {{{
" interactive substitution
set inccommand=nosplit
" case insensitive search if query is lowercase
set ignorecase smartcase
" use rg for grep
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set grepformat=%f:%l:%c:%m,%f:%l%m,%f\ \ %l%m
" }}}