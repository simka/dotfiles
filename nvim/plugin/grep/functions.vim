function Grep(args)
  let args = split(a:args, ' ')
  return system(join([&grepprg, shellescape(args[0]), get(args, 1, '')], ' '))
endfunction

