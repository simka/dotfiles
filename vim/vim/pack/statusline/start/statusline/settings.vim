set noshowmode
set laststatus=2

set statusline=%{RedrawModeColors(mode())}
" Left side items
" =======================
set statusline+=%#MyStatuslineAccent#
set statusline+=%#MyStatuslineAccentBody#\ 
" Filename
set statusline+=%#MyStatuslineFilename#\ %.50f
set statusline+=%#MyStatuslineSeparator#\ 
" Modified status
set statusline+=%#MyStatuslineModified#
set statusline+=%#MyStatuslineModifiedBody#%{SetModifiedSymbol(&modified)}
set statusline+=%#MyStatuslineModified#
" Right side items
" =======================
set statusline+=%=
" Line and Column
set statusline+=%#MyStatuslineLineCol#
set statusline+=%#MyStatuslineLineColBody#%2l
set statusline+=\/%#MyStatuslineLineColBody#%2c
set statusline+=%#MyStatuslineLineCol#
" Padding
set statusline+=\ 
" Current scroll percentage and total lines of the file
set statusline+=%#MyStatuslinePercentage#
set statusline+=%#MyStatuslinePercentageBody#%P
set statusline+=\/\%#MyStatuslinePercentageBody#%L
set statusline+=%#MyStatuslinePercentage#
" Padding
set statusline+=\ 
" Filetype
set statusline+=%#MyStatuslineFiletype#
set statusline+=%#MyStatuslineFiletypeBody#%{SetFiletype(&filetype)}
set statusline+=%#MyStatuslineFiletype#

" Setup the colors
hi StatusLine          ctermfg=5     ctermbg=NONE     cterm=NONE
hi StatusLineNC        ctermfg=8     ctermbg=NONE     cterm=bold

hi MyStatuslineSeparator ctermfg=0 cterm=NONE ctermbg=NONE

hi MyStatuslineModified ctermfg=0 cterm=NONE ctermbg=NONE

hi MyStatuslineFiletype ctermbg=NONE cterm=NONE ctermfg=0
hi MyStatuslineFiletypeBody ctermfg=5 cterm=italic ctermbg=0

hi MyStatuslinePercentage ctermfg=0 cterm=NONE ctermbg=NONE
hi MyStatuslinePercentageBody ctermbg=0 cterm=none ctermfg=6

hi MyStatuslineLineCol ctermfg=0 cterm=NONE ctermbg=NONE
hi MyStatuslineLineColBody ctermbg=0 cterm=none ctermfg=2
