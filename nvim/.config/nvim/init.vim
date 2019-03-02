" UI {{{
set termguicolors
let g:falcon_background = 0
let g:falcon_inactive = 1
colorscheme falcon
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
set cmdheight=1
set updatetime=300
set signcolumn=yes
" }}}

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

" Statusline {{{
set laststatus=2
set statusline=
" filename, flags
set statusline=%f\ »\ %w\ %h\ %m\ %r
" line, column
set statusline+=%=\ %l:%c\ «\ 
" quickfix and loclist flag
set statusline+=%(%{statusline#loclist()}%{statusline#quickfix()}%)
" }}}

" COMMANDS {{{
command! PackUpdate call plugins#init() | call minpac#update() " update plugins
command! PackClean call plugins#init() | call minpac#clean() " remove unused plugins
command! PackStatus call plugins#init() | call minpac#status() " plugins status
command! -bang -nargs=* Make call asyncdo#run(<bang>0, &makeprg, <f-args>) " async make
command! -bang -nargs=* LMake call asyncdo#lrun(<bang>0, &makeprg, <f-args>) " async lmake

augroup autoreload_config " autoreload config on change
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

augroup completion_preview " close completion preview when not needed anymore
  autocmd!
  autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

augroup splits " even out splits
  autocmd!
  autocmd VimResized * wincmd =
augroup END

augroup autoread " check for file changes more often
  autocmd!
  autocmd BufEnter,FocusGained * :checktime
augroup END
" }}}

" MAPPINGS {{{
" general
nnoremap Y y$
inoremap jk <esc>

" formatting and indentation
nnoremap g= gg=Gg``
noremap  Q  gq
nnoremap gQ mmgggqG`m

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
nnoremap <Space>g :grep 
nnoremap <Space>sf :Files<CR>
nnoremap <Space>sb :Buffers<CR>
nnoremap <Space>sh :Helptags<CR>
nnoremap <Space>sm :Marks<CR>

" files (vim-eunuch)
nnoremap <Space>fd :Delete<CR>
nnoremap <Space>fm :Move 
nnoremap <Space>fr :Rename 
nnoremap <Space>fw :Wall<CR>

" completion (coc.vim)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Remap for rename current word
nmap <Space>rn <Plug>(coc-rename)
" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
" }}}

" FUNCTIONS {{{
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" }}}

" PLUGINS' SETTINGS {{{
" netrw (disable)
let g:loaded_netrw = 1
let g:netrw_loaded_netrwPlugin = 1

" vim-javascript
let g:javascript_plugin_flow = 1

" vim-jsx
let g:jsx_ext_required = 0

" vimtex
let g:vimtex_view_method = 'zathura'

" HighlihtedYank
let g:highlightedyank_highlight_duration = 400

" startify
let g:startify_list_order = ['sessions', 'dir']
let g:startify_session_dir = '~/.local/share/nvim/sessions/'
let g:startify_session_autoload = 1
let g:startify_session_persistence = 1
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
" }}}
