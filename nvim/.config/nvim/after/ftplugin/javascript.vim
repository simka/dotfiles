set formatprg=./node_modules/.bin/prettier\ --config-precedence\ prefer-file\ --stdin\ --stdin-filepath\ %:p

" enable flow LS and disable TS server if flow is installed in current project
if executable('./node_modules/.bin/flow')
    call coc#config('languageserver.flow.enable', v:true)
    call coc#config('tsserver.enableJavascript', v:false)
endif
