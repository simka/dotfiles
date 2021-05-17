local wk = require("which-key") 

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

wk.register({
  ["<space>"] = {
    ["/"] = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "grep" },
    ["<space>"] = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "find" },
    w = {
      name = "+window",
      s = { ":split<cr>", "horizontal split" },
      v = { ":vsplit<cr>", "vertical split" },
    },
    f = {
      name = "+files",
      e = { "<cmd>lua require('telescope.builtin').file_browser()<cr>", "explore" },
      f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "find" },
      r = { "<cmd>lua require('telescope.builtin').oldfiles()<cr>", "recent" },
    },
    b = {
      name = "+buffers",
      f = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "find" },
    },
    g = {
      name = "+grep",
      g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "live" },
      w = { "<cmd>lua require('telescope.builtin').grep_string()<cr>", "word under cursor" },
    },
    c = {
      name = "+commands",
      f = { "<cmd>lua require('telescope.builtin').commands()<cr>", "find" },
      h = { "<cmd>lua require('telescope.builtin').command_history()<cr>", "history" },
    },
    s = {
      name = "+search",
      h = { "<cmd>lua require('telescope.builtin').search_history()<cr>", "history" },
    },
    t = {
      name = "+trouble",
      d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "document diagnostics" },
      r = { "<cmd>Trouble lsp_references<cr>", "references" },
      l = { "<cmd>Trouble loclist<cr>", "loclist" },
      q = { "<cmd>Trouble quickfix<cr>", "quickfix" },
      w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "workspace diagnostics" }
    },
    p = "which_key_ignore",
    ["!"] = "which_key_ignore",
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
