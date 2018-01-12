let mapleader = "\<space>" " map leader key to space

source ~/.config/nvim/packages.vim

" DEFAULTS {{{
augroup defaults
  autocmd!
  autocmd User ALELint call statusline#MaybeUpdateLightline() " update lightline on linter change
  autocmd VimResized * wincmd =
augroup END

" }}}
" GENERAL {{{
" UI {{{
" colorscheme
syntax sync minlines=256
colorscheme blame
" hide mode indicator
set noshowmode
" highlight current line
set cursorline
" set relative line numbers
set number relativenumber
" show invisibles
set list listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
" sane splits
set splitbelow splitright
" save buffers as often as possible
set autowriteall
" allow hiding modified buffers
set hidden
" persistent undo
set undofile
" use system clipboard
set clipboard^=unnamed
set scrolloff=5
" }}}
" Indentation {{{
set shiftwidth=2
set softtabstop=2
set expandtab
" }}}
" Search {{{
" highlight search matches
set hlsearch
" interactive substitution
set inccommand=nosplit
" case insensitive search if query is lowercase
set ignorecase smartcase
" }}}
" }}}

" COMMANDS {{{
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
" }}}

" MAPPINGS {{{
nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap : ;
nnoremap Y y$
inoremap jk <esc>

nnoremap <leader>.e :vsplit $MYVIMRC<CR>
nnoremap <leader>.s :source $MYVIMRC<CR>
nnoremap <Leader>u :GundoToggle<CR>
" window
nnoremap <Leader>ws :split<CR>
nnoremap <Leader>wv :vsplit<CR>
" buffer
nnoremap <Leader>bn :enew<CR>
nnoremap <Leader>bd :BD<CR>
" search
nnoremap <Leader>sb :Buffers<CR>
nnoremap <Leader>sl :Lines<CR>
nnoremap <Leader>sf :Files<CR>
nnoremap <Leader>sg :Grepper -tool rg<CR>
nnoremap <Leader>* :Grepper -cword -noprompt -tool rg<CR>
" ale
nnoremap <Leader>e[ <Plug>(ale_previous_wrap)
nnoremap <Leader>e] <Plug>(ale_next_wrap)
" files (vim-eunuch)
nnoremap <Leader>fd :Delete<CR>
nnoremap <Leader>fm :Move 
nnoremap <Leader>fr :Rename 
nnoremap <Leader>fw :Wall<CR>
" git (vim-fugitive)
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gf :Gpull<CR>
" }}}

" PLUGINS' SETTINGS {{{
" vim-javascript
let g:javascript_plugin_flow = 1
" vim-jsx
let g:jsx_ext_required = 0

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#sources#ternjs#filetypes = ['jsx', 'react.js']

" ale
let g:ale_linters = { 'javascript': ['eslint'], 'elixir': ['credo'] }
let g:ale_fixers = { 'javascript': ['prettier', 'eslint'] }
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma all'
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✖'

" minisnip
let g:minisnip_dir = '~/.config/nvim/minisnip'

" grepper
let g:grepper= {}
let g:grepper.tools = ['rg']

" gundo
let g:gundo_prefer_python3 = 1

" goyo
augroup Goyo
  autocmd! User GoyoEnter Limelight 0.7
  autocmd! User GoyoLeave Limelight!
augroup END

" fzf
let g:fzf_colors = {
\ 'fg':      ['fg', 'Normal'],
\ 'bg':      ['bg', 'Normal'],
\ 'hl':      ['fg', 'Comment'],
\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
\ 'hl+':     ['fg', 'Statement'],
\ 'info':    ['fg', 'PreProc'],
\ 'border':  ['fg', 'Ignore'],
\ 'prompt':  ['fg', 'Conditional'],
\ 'pointer': ['fg', 'Exception'],
\ 'marker':  ['fg', 'Keyword'],
\ 'spinner': ['fg', 'Label'],
\ 'header':  ['fg', 'Comment'] }

" lightline
let g:lightline = {
\ 'colorscheme': 'jellybeans',
\ 'active': {
\   'left': [['mode', 'paste'], ['gitbranch', 'filename', 'modified']],
\   'right': [['lineinfo'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_function': {
\   'gitbranch': 'fugitive#head'
\ },
\ 'component_expand': {
\   'linter_warnings': 'statusline#LightlineLinterWarnings',
\   'linter_errors': 'statusline#LightlineLinterErrors',
\   'linter_ok': 'statusline#LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }
" }}}
