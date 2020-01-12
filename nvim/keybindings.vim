" MISC
nnoremap Y y$
inoremap jk <esc>

" GREP
nnoremap <Space>g :Grep 
nnoremap <Space>/ :Rg

" OPEN
nnoremap <Space>o- :Dirvish<CR>
nnoremap <Space>oq :copen<CR>
nnoremap <Space>ol :lopen<CR>
nnoremap <Space>oe :terminal<CR>

" FILES
nnoremap <Space>. :Files<CR>
nnoremap <Space><Space> :Files<CR>
nnoremap <Space>ff :Files<CR>
nnoremap <Space>fr :History<CR>
nnoremap <Space>fd :Delete<CR>
nnoremap <Space>fm :Move 
nnoremap <Space>fR :Rename 
nnoremap <Space>fw :Wall<CR>
nnoremap <Space>fn :e %

" DIRECTORIES (TO BE USED IN DIRVISH BUFFER)
nnoremap <Space>dn :!mkdir %

" BUFFERS
nnoremap <Space>bb :Buffers<CR>
nnoremap <Space>, :Buffers<CR>
nnoremap <Space>bn :enew<CR>
nnoremap <Space>bk :BD<CR>
nnoremap <Space>bs :w %

" WINDOWS
nnoremap <Space>wv :vsplit<CR>
nnoremap <Space>ws :split<CR>
nnoremap <Space>ww :wincmd w<CR>

" completion (coc.nvim)
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ Check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-TAB> coc#refresh()

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
nnoremap <silent> K :call Show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

