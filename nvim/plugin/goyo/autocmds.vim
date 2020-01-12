augroup goyo
  autocmd!

  autocmd! User GoyoEnter Limelight | call Goyo_enter()
  autocmd! User GoyoLeave Limelight! | call Goyo_leave()

augroup END
