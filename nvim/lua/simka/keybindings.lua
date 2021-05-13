--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap=true, expr = true, silent = true})
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", {noremap= true, expr = true, silent = true})

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

-- telescope
vim.api.nvim_set_keymap('n', '<space><space>', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>/', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>fb', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>ff', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>fc', [[<cmd>lua require('telescope.builtin').git_commits()<cr>]], { noremap = true, silent = true})

-- splits
vim.api.nvim_set_keymap('n', '<space>wv', ':vsplit<cr>', { noremap= true })
vim.api.nvim_set_keymap('n', '<space>ws', ':split<cr>', { noremap= true })
