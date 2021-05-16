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

-- highlight cursorline
vim.o.cursorline = true

-- use relative linenumbers
vim.wo.number = true
vim.wo.relativenumber = true

-- use system clipboard by default
vim.cmd[[set clipboard+=unnamedplus]]

-- indentation
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

-- always show 15 lines between cursorline and top/bottom
vim.o.scrolloff = 15
