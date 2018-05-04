function! plugins#init() abort
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Colorscheme {{{
  call minpac#add('hauleth/blame.vim')
  call minpac#add('andreypopp/vim-colors-plain')
  " }}}
  " Fuzzy search {{{
  call minpac#add('junegunn/fzf')
  call minpac#add('junegunn/fzf.vim')
  " }}}
  " File manipulation {{{
  call minpac#add('tpope/vim-eunuch', {'type': 'opt'})
  call minpac#add('justinmk/vim-dirvish')
  " }}}
  " Text manipulation {{{
  call minpac#add('jiangmiao/auto-pairs', {'type': 'opt'})
  call minpac#add('tpope/vim-surround', {'type': 'opt'})
  call minpac#add('tpope/vim-commentary', {'type': 'opt'})
  " }}}
  " Linting and completion {{{
  call minpac#add('w0rp/ale')
  call minpac#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })
  call minpac#add('slashmili/alchemist.vim')
  " }}}
  " Git {{{
  call minpac#add('airblade/vim-gitgutter', {'type': 'opt'})
  call minpac#add('tpope/vim-fugitive')
  " }}}
  " Languages {{{
  call minpac#add('pangloss/vim-javascript')
  call minpac#add('mxw/vim-jsx')
  call minpac#add('elixir-lang/vim-elixir')
  call minpac#add('othree/html5.vim')
  call minpac#add('styled-components/vim-styled-components')
  call minpac#add('hail2u/vim-css3-syntax')
  call minpac#add('cakebaker/scss-syntax.vim')
  call minpac#add('stephpy/vim-yaml')
  call minpac#add('elzr/vim-json')
  " }}}
  " Utils {{{
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('mhinz/vim-startify') " start screen
  call minpac#add('christoomey/vim-tmux-navigator')
  call minpac#add('qpkorr/vim-bufkill') " close buffers with BD without closing window
  call minpac#add('romainl/vim-cool') " hide search highlight when not searching
  call minpac#add('xtal8/traces.vim') " highlight patterns and ranges
  call minpac#add('machakann/vim-highlightedyank') " highlight yanked text
  " }}}
endfunction