" update plugins
command! PackUpdate call PluginsInit() | call minpac#update()
" remove unused plugins
command! PackClean call PluginsInit() | call minpac#clean()
" plugins status
command! PackStatus call PluginsInit() | call minpac#status()

