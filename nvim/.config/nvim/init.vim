set nocompatible " be explicit about it
let mapleader = "\<space>" " map leader key to space

" install Plug if not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config//nvim/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-sensible' " sensible defaults
Plug 'tpope/vim-unimpaired' " handy bracket mappings
Plug 'tpope/vim-repeat' " include surround, commentary and unimpaired plugin maps when repeating cmd with .

" GIT
Plug 'tpope/vim-fugitive' " git wrapper
Plug 'airblade/vim-gitgutter' " show git diff in gutter

" formatting
Plug 'tpope/vim-surround' " quoting/parenthesizing enhancements
Plug 'tpope/vim-commentary' " comments enhancement
Plug 'Raimondi/delimitMate' " auto-closing brackets, parens etc.
Plug 'Yggdroot/indentLine' " show indentation
let g:indentLine_char = '¦'
let g:indentLine_leadingSpaceChar = '·'

" navigation and files
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-eunuch' " file management

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy search
Plug 'junegunn/fzf.vim'
" Rg command to search with rg and show results with fzf
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --ignore-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)
" fzf colors
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
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

Plug 'qpkorr/vim-bufkill' " close buffers with BD without closing window
Plug 'christoomey/vim-tmux-navigator' " tmux pane integration

" linting
Plug 'w0rp/ale'
let g:ale_fixers = { 'javascript': ['eslint', 'prettier'] }
let g:ale_javascript_pretier_options = '--single-quote --trailing-comma all'
let g:ale_fix_on_save = 1
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✖'

" autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#sources#ternjs#filetypes = ['jsx', 'react.js']
" Plug 'steelsojka/deoplete-flow'

" languages
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
let g:javascript_plugin_flow = 1
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'stephpy/vim-yaml'
Plug 'elzr/vim-json'

" rainbow parens
Plug 'kien/rainbow_parentheses.vim'
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

Plug 'junegunn/goyo.vim' " distraction-free mode
Plug 'junegunn/limelight.vim' " dim paragraphs other than current
autocmd! User GoyoEnter Limelight 0.7
autocmd! User GoyoLeave Limelight!

" color scheme
Plug 'romainl/Apprentice'
Plug 'arcticicestudio/nord-vim'

" lightline
Plug 'itchyny/lightline.vim'
let g:lightline = {
\ 'colorscheme': 'nord',
\ 'active': {
\   'left': [['mode', 'paste'], ['gitbranch', 'filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_function': {
\   'gitbranch': 'fugitive#head'
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ▲', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✖', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction
call plug#end()

" file types
autocmd BufWritePre * :%s/\s\+$//e " remove whitespace on save
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " disable comment on newline

" indent, whitespace etc.
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" look and feel
set t_Co=256
syntax on
let g:nord_uniform_diff_background = 1
colorscheme nord
set number relativenumber
set cursorline " highlight current line
set title " window title = filename
set lazyredraw " redraw less often
set noshowmode " hide mode indicator, since airline shows it
" more natural splits
set splitbelow
set splitright
set hidden " allow modified buffers to be hidden

" search
set hlsearch " highlight search matches
" case insensitive search if query is lowercase
set ignorecase
set smartcase


" mappings

" FZF
nmap <Leader>b :Buffers<CR>
nmap <Leader>p :Files<CR>
nmap <Leader>l :Lines<CR>
nmap <Leader>g :Rg

nmap <leader>n :enew<CR>
