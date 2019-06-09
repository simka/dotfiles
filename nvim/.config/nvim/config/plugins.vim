" coc.nvim
let g:coc_global_extensions = ['coc-css', 'coc-eslint', 'coc-html', 'coc-json', 'coc-sh', 'coc-stylelint', 'coc-tslint', 'coc-tsserver', 'coc-yaml']

" netrw (disable)
let g:loaded_netrw = 1
let g:netrw_loaded_netrwPlugin = 1

" vim-javascript
let g:javascript_plugin_flow = 1

" vim-jsx
let g:jsx_ext_required = 0

" vimtex
let g:vimtex_view_method = 'zathura'

" HighlihtedYank
let g:highlightedyank_highlight_duration = 400

" startify
let g:startify_list_order = ['sessions', 'dir']
let g:startify_session_dir = '~/.local/share/nvim/sessions/'
let g:startify_session_autoload = 1
let g:startify_session_persistence = 1
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
