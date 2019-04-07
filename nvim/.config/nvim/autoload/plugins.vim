function! plugins#init() abort
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Colorscheme {{{
  call minpac#add('dracula/vim')
  " }}}
  " Fuzzy search {{{
  call minpac#add('junegunn/fzf.vim')
  " }}}
  " File manipulation {{{
  call minpac#add('tpope/vim-eunuch')
  call minpac#add('justinmk/vim-dirvish')
  " }}}
  " Text manipulation {{{
  call minpac#add('jiangmiao/auto-pairs')
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('wellle/targets.vim')
  " }}}
  " LSP and completion {{{
  call minpac#add('neoclide/coc.nvim', {'do': {-> coc#util#install()}}) " LSP
  call minpac#add('Shougo/echodoc.vim') " print docs in echo
  " }}}
  " Languages {{{
  call minpac#add('cakebaker/scss-syntax.vim') " scss
  call minpac#add('elixir-lang/vim-elixir') " elixir
  call minpac#add('elzr/vim-json') " json
  call minpac#add('hail2u/vim-css3-syntax') " css
  call minpac#add('leafgarland/typescript-vim') " typescript
  call minpac#add('lervag/vimtex') " latex
  call minpac#add('mxw/vim-jsx') " jsx
  call minpac#add('othree/html5.vim') " html
  call minpac#add('pangloss/vim-javascript') " javascript
  call minpac#add('stephpy/vim-yaml') " yaml
  call minpac#add('styled-components/vim-styled-components') " styled-components
  call minpac#add('tidalcycles/vim-tidal') " tidalcycles
  " }}}
  " Utils {{{
  call minpac#add('christoomey/vim-tmux-navigator') " common mapping for changing vim and tmux splits
  call minpac#add('hauleth/asyncdo.vim') " run commands asynchronously
  call minpac#add('igemnace/vim-makery') " easy makeprg definitions for projects
  call minpac#add('junegunn/vim-peekaboo') " show registers content when pasting or copying from one
  call minpac#add('machakann/vim-highlightedyank') " highlight yanked text
  call minpac#add('mhinz/vim-startify') " start screen
  call minpac#add('qpkorr/vim-bufkill') " close buffers with BD without closing window
  call minpac#add('romainl/vim-cool') " hide search highlight when not searching
  call minpac#add('romainl/vim-qf') " quicklist enhancements
  call minpac#add('romainl/vim-qlist') " show include-search and definition-search results in quicklist
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('xtal8/traces.vim') " highlight patterns and ranges
  call minpac#add('airblade/vim-rooter') " automatically set root based on .git directory
  " }}}
endfunction
