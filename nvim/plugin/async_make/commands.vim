command! -bang -nargs=* Make call asyncdo#run(<bang>0, &makeprg, <f-args>)
command! -bang -nargs=* LMake call asyncdo#lrun(<bang>0, &makeprg, <f-args>)
