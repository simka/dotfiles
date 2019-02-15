" recognize ES6 import statements
let &l:include = 'from\|require'

" use ES6 export statements as define statements
let &l:define = '\v(export\s+(default\s+)?)?(var|let|const|(async\s+)?function|class)|export\s+'

set formatprg=prettier\ --single-quote\ --trailing-comma\ es5\ --config-precedence\ prefer-file\ --stdin\ --stdin-filepath\ %:p

