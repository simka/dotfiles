" update plugins
command! PackUpdate call plugins#init() | call minpac#update()
" remove unused plugins
command! PackClean call plugins#init() | call minpac#clean()
" plugins status
command! PackStatus call plugins#init() | call minpac#status()

" async make
command! -bang -nargs=* Make call asyncdo#run(<bang>0, &makeprg, <f-args>)
" async lmake
command! -bang -nargs=* LMake call asyncdo#lrun(<bang>0, &makeprg, <f-args>)

" grep
command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<q-args>)
command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr Grep(<q-args>)

" coc.nvim
" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
