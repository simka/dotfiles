packadd minpac

call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})

" Utils {{{
call minpac#add('tpope/vim-sensible')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-repeat')
call minpac#add('mhinz/vim-startify') " start screen
call minpac#add('tpope/vim-projectionist') " project configuration
call minpac#add('junegunn/goyo.vim') " focus mode
call minpac#add('junegunn/limelight.vim') " focus mode
call minpac#add('sjl/gundo.vim') " visual undo tree
call minpac#add('christoomey/vim-tmux-navigator')
call minpac#add('qpkorr/vim-bufkill') " close buffers with BD without closing window
call minpac#add('romainl/vim-cool') " hide search highlight when not searching
call minpac#add('KeyboardFire/vim-minisnip') " snippets
call minpac#add('xtal8/traces.vim') " highlight patterns and ranges
" }}}
" Colorscheme {{{
call minpac#add('itchyny/lightline.vim')
call minpac#add('hauleth/blame.vim')
" }}}
" File manipulation {{{
call minpac#add('tpope/vim-eunuch')
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
call minpac#add('justinmk/vim-dirvish')
call minpac#add('mhinz/vim-grepper')
" }}}
" Text manipulation {{{
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-commentary')
" }}}
" Linting and completion {{{
call minpac#add('w0rp/ale')
call minpac#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })
call minpac#add('carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' })
" call minpac#add('steelsojka/deoplete-flow')
call minpac#add('slashmili/alchemist.vim')
" }}}
" Git {{{
call minpac#add('tpope/vim-fugitive')
call minpac#add('airblade/vim-gitgutter')
" }}}
" Languages {{{
call minpac#add('pangloss/vim-javascript')
call minpac#add('mxw/vim-jsx')
call minpac#add('rust-lang/rust.vim')
call minpac#add('elixir-lang/vim-elixir')
call minpac#add('othree/html5.vim')
call minpac#add('hail2u/vim-css3-syntax')
call minpac#add('cakebaker/scss-syntax.vim')
call minpac#add('stephpy/vim-yaml')
call minpac#add('elzr/vim-json')
call minpac#add('toml-lang/toml')
" }}}
" Related commands {{{
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
" }}}
