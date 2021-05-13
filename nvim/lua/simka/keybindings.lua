local wk = require("which-key") 

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

wk.register({
  ["<space>"] = {
    ["/"] = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "grep", noremap = false },
    ["<space>"] = { "<cmd>lua require('telescope.builtin').grep_string()<cr>", "grep word under cursor", noremap = false },
    w = {
      name = "+window",
      s = { ":vsplit<cr>", "horizontal split", noremap = false },
      v = { ":vsplit<cr>", "vertical split", noremap = false },
    },
    f = {
      name = "+files",
      e = { "<cmd>lua require('telescope.builtin').file_browser()<cr>", "explore", noremap = false },
      f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "find", noremap = false },
      r = { "<cmd>lua require('telescope.builtin').oldfiles()<cr>", "recent", noremap = false },
    },
    b = {
      name = "+buffers",
      f = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "find", noremap = false },
    },
    c = {
      name = "+commands",
      f = { "<cmd>lua require('telescope.builtin').commands()<cr>", "find", noremap = false },
      h = { "<cmd>lua require('telescope.builtin').command_history()<cr>", "history", noremap = false },
    },
    s = {
      name = "+search",
      h = { "<cmd>lua require('telescope.builtin').search_history()<cr>", "history", noremap = false },
    }
  }
})
 

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap=true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap= true, expr = true, silent = true })

-- Y yank until the end of line
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true})

--Remap escape to leave terminal mode
vim.api.nvim_exec([[
  augroup Terminal
    autocmd!
    au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
    au TermOpen * set nonu
  augroup end
]], false)
