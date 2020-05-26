augroup coc
  autocmd!

  " coc.vim highlight
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')

  " organize imports in Go on save
  autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

augroup END
