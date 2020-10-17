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

" TERMINAL
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" COMPLETION
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)

" LSP
nmap <silent> <Space>ld <Plug>(lsp-definition)
nmap <silent> <Space>lr <Plug>(lsp-references)
nmap <silent> <Space>lh <Plug>(lsp-hover)
nmap <silent> <Space>ldd <Plug>(lsp-document-diagnostics)
nmap <silent> <Space>lf <Plug>(lsp-document-format)

" FORMATTING
nnoremap <Space>p :Prettier<CR>
