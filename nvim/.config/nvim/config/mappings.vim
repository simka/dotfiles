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

" completion (coc.nvim)
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ functions#check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call functions#show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

