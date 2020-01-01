if exists("current_compiler")
  finish
endif
let current_compiler = "flow"

if exists(":CompilerSet") != 2
  command! -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=./node_modules/.bin/flow
CompilerSet errorformat=%EFile "%f"\, line %l\, characters %c-%.%#,%Z%m,
