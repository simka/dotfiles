if !exists('g:env')
  if has('win64') || has('win32') || has('win16')
    let g:env = 'WINDOWS'
  else
    let g:env = toupper(substitute(system('uname'), '\n', '', ''))
  endif
endif

" macOS specific stuff
if g:env =~ 'DARWIN'
  set rtp+=/usr/local/opt/fzf
endif

source $HOME/.config/nvim/config/settings.vim
source $HOME/.config/nvim/config/plugins.vim
source $HOME/.config/nvim/config/functions.vim
source $HOME/.config/nvim/config/commands.vim
source $HOME/.config/nvim/config/autocmds.vim
source $HOME/.config/nvim/config/mappings.vim
source $HOME/.config/nvim/config/statusline.vim

