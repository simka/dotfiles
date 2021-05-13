--Set colorscheme
vim.cmd[[colorscheme tokyonight]]

--Do not save when switching buffers
vim.o.hidden = true

--Save undo history
vim.cmd[[set undofile]]

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Incremental live completion
vim.o.inccommand = "nosplit"

--Enable mouse mode
vim.o.mouse = "a"

--Enable break indent
vim.o.breakindent = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn="yes"

-- more intuitive splits
vim.o.splitbelow = true
vim.o.splitright = true

-- everything below needs commentary/checking if it's necessary
vim.o.cursorline = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.scrolloff = 15
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
--Add map to enter paste mode
vim.o.pastetoggle="<F3>"
