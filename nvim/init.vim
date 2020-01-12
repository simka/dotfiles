if !exists('g:env')
  if has('win64') || has('win32') || has('win16')
    let g:env = 'WINDOWS'
  else
    let g:env = toupper(substitute(system('uname'), '\n', '', ''))
  endif
endif

" macOS specific settings
if g:env =~ 'DARWIN'
  set rtp+=/usr/local/opt/fzf
endif

" UI {{{
colorscheme lena
set cursorline " highlight current line
set number relativenumber " set relative line numbers
set list listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:· " show invisibles
set splitbelow splitright " more intuitive vertical and horizontal splits
set autowriteall " save buffers as often as possible
set hidden " allow hiding modified buffers
set undofile " persistent undo
set clipboard^=unnamedplus " use system clipboard
set scrolloff=15
set cmdheight=2
set shortmess+=c
set updatetime=300
set signcolumn=yes
" }}}

" avoid issues with language servers
set nobackup
set nowritebackup

" Indentation {{{
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set foldmethod=syntax
set foldlevel=999
" }}}

" soft text wrapping
set wrap
set linebreak
set nolist

" Search {{{
" interactive substitution
set inccommand=nosplit
" case insensitive search if query is lowercase
set ignorecase smartcase
" use rg for grep
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set grepformat=%f:%l:%c:%m,%f:%l%m,%f\ \ %l%m
" }}}

" Plugins {{{
" coc.nvim
let g:coc_global_extensions = ['coc-css', 'coc-elixir', 'coc-eslint', 'coc-go', 'coc-html', 'coc-json', 'coc-prettier', 'coc-sh', 'coc-snippets', 'coc-stylelint', 'coc-tsserver', 'coc-yaml']

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient
let g:go_def_mapping_enabled = 0

" netrw (disable)
let g:loaded_netrw = 1
let g:netrw_loaded_netrwPlugin = 1

" vim-javascript
let g:javascript_plugin_flow = 1

" vim-jsx
let g:jsx_ext_required = 0

" HighlihtedYank
let g:highlightedyank_highlight_duration = 400

" startify
let g:startify_session_dir = '~/.local/share/nvim/sessions/'
let g:startify_lists = [
  \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ ]
let g:startify_bookmarks = [ '~/dotfiles', '~/.config/nvim/autoload/plugins.vim' ]
let g:startify_session_persistence = 1
let g:startify_change_to_dir = 0
let g:startify_session_sort = 1
let g:startify_custom_header = ''
" }}}


augroup autocmds
  autocmd!

 " even out splits
  autocmd VimResized * wincmd =

 " check for file changes more often
  autocmd BufEnter,FocusGained * :checktime

augroup END

runtime! keybindings.vim
