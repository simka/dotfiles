set laststatus=2
set statusline=
" filename, flags
set statusline=%f\ »\ %w\ %h\ %m\ %r
" line, column
set statusline+=%=\ %l:%c\ «\ 
" quickfix and loclist flag
set statusline+=%(%{statusline#loclist()}%{statusline#quickfix()}%)
