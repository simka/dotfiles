require('simka/plugins')
require('simka/options')
require('simka/keybindings')
require('simka/lsp')
require('simka/completion')

-- Highlight on yank
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]], false)

