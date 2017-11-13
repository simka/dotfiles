let mapleader = "\<space>" " map leader key to space

call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-sensible' " sensible defaults
Plug 'tpope/vim-unimpaired' " handy bracket mappings
Plug 'tpope/vim-repeat' " include surround, commentary and unimpaired plugin maps when repeating cmd with .
Plug 'tpope/vim-fugitive' " git wrapper
Plug 'tpope/vim-surround' " quoting/parenthesizing enhancements
Plug 'tpope/vim-commentary' " comments enhancement
Plug 'tpope/vim-eunuch' " file management
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy search
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim' " distraction-free mode
Plug 'junegunn/limelight.vim' " dim paragraphs other than current
Plug 'airblade/vim-gitgutter' " show git diff in gutter
Plug 'Raimondi/delimitMate' " auto-closing brackets, parens etc.
Plug 'Yggdroot/indentLine' " show indentation
Plug 'justinmk/vim-dirvish'
Plug 'qpkorr/vim-bufkill' " close buffers with BD without closing window
Plug 'christoomey/vim-tmux-navigator' " tmux pane integration
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" Plug 'steelsojka/deoplete-flow'
Plug 'sjl/gundo.vim' " visual undo tree
Plug 'romainl/Apprentice'
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'stephpy/vim-yaml'
Plug 'elzr/vim-json'
call plug#end()

" DEFAULTS {{{
  if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading
  endif

  augroup defaults
    autocmd!

    autocmd BufWritePre * :%s/\s\+$//e " remove whitespace on save
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " disable comment on newline
    autocmd FocusLost * call autosave#AutoSave()
    autocmd BufLeave * let b:winview = winsaveview() " preserve cursor position
    autocmd BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif

    autocmd User ALELint call statusline#MaybeUpdateLightline() " update lightline on linter change

    autocmd BufNewFile,BufRead *.md,*.markdown setlocal filetype=markdown " markdown
  augroup END
" }}}

" SETTINGS/UI {{{
  " look and feel
  syntax on
  let g:nord_uniform_diff_background = 1
  colorscheme nord
  set number relativenumber
  set cursorline " highlight current line
  set list
  set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
  set title " window title = filename
  set lazyredraw " redraw less often
  set noshowmode " hide mode indicator, since airline shows it
  set splitbelow " more natural splits
  set splitright
  set hidden " allow modified buffers to be hidden
  set clipboard^=unnamed " use system clipboard

  " indent, whitespace etc.
  set shiftwidth=2
  set softtabstop=2
  set expandtab

  " search
  set hlsearch " highlight search matches
  set ignorecase " case insensitive search if query is lowercase
  set smartcase

  set undofile " persistent undo
" }}}

" COMMANDS {{{
  command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --ignore-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
" }}}

" MAPPINGS {{{
  nmap <Leader>fb :Buffers<CR>
  nmap <Leader>fl :Lines<CR>
  nmap <Leader>ff :Files<CR>
  nmap <Leader>g :Rg
  nmap <leader>n :enew<CR>
  nmap <leader>u :GundoToggle<CR>
  nnoremap <esc><esc> :nohlsearch<CR>
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
  let g:ale_fixers = { 'javascript': ['eslint', 'prettier'] }
  let g:ale_javascript_pretier_options = '--single-quote --trailing-comma all'
  let g:ale_fix_on_save = 1
  let g:ale_sign_warning = '▲'
  let g:ale_sign_error = '✖'

  " gundo
  let g:gundo_prefer_python3 = 1

  " goyo
  augroup Goyo
    autocmd! User GoyoEnter Limelight 0.7
    autocmd! User GoyoLeave Limelight!
  augroup END

  " fzf
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

  " indentLine
  let g:indentLine_char = '¦'
  let g:indentLine_leadingSpaceChar = '·'

  " lightline
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
