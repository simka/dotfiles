" coc.nvim
let g:coc_global_extensions = ['coc-css', 'coc-elixir', 'coc-eslint', 'coc-html', 'coc-json', 'coc-rls', 'coc-sh', 'coc-stylelint', 'coc-tsserver', 'coc-yaml']

" netrw (disable)
let g:loaded_netrw = 1
let g:netrw_loaded_netrwPlugin = 1

" vim-javascript
let g:javascript_plugin_flow = 1

" vim-jsx
let g:jsx_ext_required = 0

" rust
let g:rustfmt_autosave = 1

" HighlihtedYank
let g:highlightedyank_highlight_duration = 400

" startify
let g:startify_session_dir = '~/.local/share/nvim/sessions/'
let g:startify_lists = [
  \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ ]
let g:startify_bookmarks = [ '~/dotfiles', '~/.config/nvim/autoload/plugins.vim' ]
let g:startify_session_persistence = 1
let g:startify_change_to_dir = 0
let g:startify_session_sort = 1
let g:startify_custom_header = ''
