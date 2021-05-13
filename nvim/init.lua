require('simka/plugins')
require('simka/telescope')
require('simka/options')
require('simka/keybindings')

-- Highlight on yank
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]], false)

require('simka/lsp')
require('simka/completion')
