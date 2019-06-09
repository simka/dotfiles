function! Check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! Show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! Grep(args)
  let args = split(a:args, ' ')
  return system(join([&grepprg, shellescape(args[0]), get(args, 1, '')], ' '))
endfunction
