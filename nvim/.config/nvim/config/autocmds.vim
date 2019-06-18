augroup autocmds
  autocmd!

 " even out splits
  autocmd VimResized * wincmd =

 " check for file changes more often
  autocmd BufEnter,FocusGained * :checktime

  " coc.vim highlight
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

  " Goyo
  autocmd! User GoyoEnter Limelight | call Goyo_enter()
  autocmd! User GoyoLeave Limelight! | call Goyo_leave()

augroup END
