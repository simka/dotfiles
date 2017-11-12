" author: romainl
" saves all the visible windows if needed/possible
function! autosave#AutoSave()
    let this_window = winnr()
    windo if &buftype != "nofile" && expand('%') != '' && &modified | write | endif
    execute this_window . 'wincmd w'
endfunction
