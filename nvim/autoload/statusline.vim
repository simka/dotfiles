function! statusline#RedrawModeColors(mode)
  " Normal mode
  if a:mode == 'n'
    hi MyStatuslineAccent ctermfg=8 cterm=NONE ctermbg=NONE
    hi MyStatuslineFilename ctermfg=4 cterm=none ctermbg=0
    hi MyStatuslineAccentBody ctermbg=8 cterm=NONE ctermfg=4
  " Insert mode
  elseif a:mode == 'i'
    hi MyStatuslineAccent ctermfg=8 cterm=NONE ctermbg=NONE
    hi MyStatuslineFilename ctermfg=1 cterm=none ctermbg=0
    hi MyStatuslineAccentBody ctermbg=8 cterm=NONE ctermfg=1
  " Replace mode
  elseif a:mode == 'R'
    hi MyStatuslineAccent ctermfg=8 cterm=NONE ctermbg=NONE
    hi MyStatuslineFilename ctermfg=3 cterm=none ctermbg=0
    hi MyStatuslineAccentBody ctermbg=8 cterm=NONE ctermfg=3
  " Visual mode
  elseif a:mode == 'v' || a:mode == 'V' || a:mode == '^V'
    hi MyStatuslineAccent ctermfg=8 cterm=NONE ctermbg=NONE
    hi MyStatuslineFilename ctermfg=5 cterm=none ctermbg=0
    hi MyStatuslineAccentBody ctermbg=8 cterm=NONE ctermfg=5
  " Command mode
  elseif a:mode == 'c'
    hi MyStatuslineAccent ctermfg=8 cterm=NONE ctermbg=NONE
    hi MyStatuslineFilename ctermfg=6 cterm=none ctermbg=0
    hi MyStatuslineAccentBody ctermbg=8 cterm=NONE ctermfg=6
  " Terminal mode
  elseif a:mode == 't'
    hi MyStatuslineAccent ctermfg=8 cterm=NONE ctermbg=NONE
    hi MyStatuslineFilename ctermfg=1 cterm=none ctermbg=0
    hi MyStatuslineAccentBody ctermbg=8 cterm=NONE ctermfg=1
  endif
  " Return empty string so as not to display anything in the statusline
  return ''
endfunction

function! statusline#SetModifiedSymbol(modified)
    if a:modified == 1
        hi MyStatuslineModifiedBody ctermbg=0 cterm=bold ctermfg=1
    else
        hi MyStatuslineModifiedBody ctermbg=0 cterm=bold ctermfg=8
    endif
    return '●'
endfunction

function! statusline#SetFiletype(filetype)
  if a:filetype == ''
      return '-'
  else
      return a:filetype
  endif
endfunction
