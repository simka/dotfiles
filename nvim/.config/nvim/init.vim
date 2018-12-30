"  autoreload config
augroup autoreload_config
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" PLUGINS {{{
command! PackUpdate call plugins#init() | call minpac#update()
command! PackClean call plugins#init() | call minpac#clean()
" }}}

" UI {{{
" colorscheme
set termguicolors
 let g:falcon_background = 0
 let g:falcon_inactive = 1
 colorscheme falcon
" set background=dark
" colorscheme plain
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
augroup splits
  autocmd!
  autocmd VimResized * wincmd =
augroup END
" save buffers as often as possible
set autowriteall
" allow hiding modified buffers
set hidden
" check for file changes more often
augroup autoread
  autocmd!
  autocmd BufEnter,FocusGained * :checktime
augroup END
" persistent undo
set undofile
" use system clipboard
set clipboard^=unnamed
set scrolloff=5
set cmdheight=2
set updatetime=300
set signcolumn=yes
" }}}

" Indentation {{{
set shiftwidth=2
set softtabstop=2
set expandtab
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

" Statusline {{{
set laststatus=2

set statusline=%f\ »\ %w\ %h\ %m\ %r
set statusline+=%=\ %l:%c\ «\ %{fugitive#head()}\ «\ 
set statusline+=\%#StatusLineOk#%{statusline#ALEStatus()}
set statusline+=\%#StatusLineError#%{statusline#ALEErrors()}
set statusline+=\%#StatusLineWarning#%{statusline#ALEWarnings()}
" }}}

" MAPPINGS {{{
nnoremap Y y$
inoremap jk <esc>

" dotfile manipulation
nnoremap <Space>.e :vsplit $MYVIMRC<CR>
nnoremap <Space>.s :source $MYVIMRC<CR>
" buffers
nnoremap <Space>bn :enew<CR>
nnoremap <Space>bd :BD<CR>
" lists
nnoremap <Space>lq :copen<CR>
nnoremap <Space>ll :lopen<CR>
" search
nnoremap <Space>sb :Buffers<CR>
nnoremap <Space>sl :Lines<CR>
nnoremap <Space>sf :Files<CR>
nnoremap <Space>g :grep 
" ale
nnoremap <Space>e[ <Plug>(ale_previous_wrap)
nnoremap <Space>e] <Plug>(ale_next_wrap)
" files (vim-eunuch)
nnoremap <Space>fd :Delete<CR>
nnoremap <Space>fm :Move 
nnoremap <Space>fr :Rename 
nnoremap <Space>fw :Wall<CR>
" completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" }}}

" PLUGINS' SETTINGS {{{
" vim-javascript
let g:javascript_plugin_flow = 1

" vim-jsx
let g:jsx_ext_required = 0

" deoplete
let g:deoplete#enable_at_startup = 1

" language server
" let g:LanguageClient_autoStart = 1
" let g:LanguageClient_serverCommands = {}

" ale
let g:ale_linters = { 'javascript': ['eslint'], 'elixir': ['credo'] }
let g:ale_fixers = { 'javascript': ['eslint', 'prettier'] }
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma all'
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_sign_column_always = 1
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✖'

" HighlihtedYank {{{
let g:highlightedyank_highlight_duration = 400
" }}}

" startify
let g:startify_list_order = ['sessions', 'dir']
let g:startify_session_dir = '~/.local/share/nvim/sessions/'
let g:startify_session_autoload = 1
let g:startify_session_persistence = 1

let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1

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
" }}}
