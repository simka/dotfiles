-- Install packer
local execute = vim.api.nvim_command

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '.. install_path)
end

vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]], false)

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'       -- Package manager
  use 'christoomey/vim-tmux-navigator' -- Tmux integration
  use 'folke/tokyonight.nvim' -- theme
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  }
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
      require('lualine').setup {
        options = {
          theme = 'tokyonight',
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch'},
          lualine_c = {'filename'},
          lualine_x = {'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        }
      }
    end
  }
  use 'hrsh7th/nvim-compe'           -- Autocompletion plugin
  use 'jiangmiao/auto-pairs' -- automatic parens insertion/removal
  use 'justinmk/vim-dirvish' -- netrw replacement
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup {}
    end
  }
  use { 'lukas-reineke/indent-blankline.nvim', branch="lua" } -- Add indentation guides even on blank lines
  vim.g.indent_blankline_char = "┊"
  vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
  vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile'}
  vim.g.indent_blankline_char_highlight = 'LineNr'

  use 'markonm/traces.vim' -- highlight patterns
  use 'mhinz/vim-startify' -- start screen
  use 'neovim/nvim-lspconfig'        -- Collection of configurations for built-in LSP client
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'kyazdani42/nvim-web-devicons', opt = true}},
    config = function()
      require('telescope').setup{
        defaults = {
          mappings = {
            i = {
              ["<C-u>"] = false,
              ["<C-d>"] = false,
            },
          },
          generic_sorter = require'telescope.sorters'.get_fzy_sorter,
          file_sorter = require'telescope.sorters'.get_fzy_sorter,
        }
      }
    end
  }
  use 'qpkorr/vim-bufkill' -- close buffer helper
  use 'romainl/vim-cool' -- search highlight
  use 'romainl/vim-qf' -- quickfix improvements
  use 'tpope/vim-abolish' -- common typo fix
  use 'tpope/vim-commentary'         -- "gc" to comment visual regions/lines
  use 'tpope/vim-eunuch' -- UNIX helpers
  use 'tpope/vim-fugitive'           -- Git commands in nvim
  use 'tpope/vim-repeat' -- . for some plugins
  use 'tpope/vim-surround' -- surrounding mappings
  use 'tpope/vim-unimpaired' -- bracket mappings

  -- better language support
  use 'MaxMEllon/vim-jsx-pretty'
  use 'cakebaker/scss-syntax.vim'
  use 'digitaltoad/vim-pug'
  use 'elzr/vim-json'
  use 'fatih/vim-go'
  vim.g.go_def_mapping_enabled  = 0 -- disable vim-go :GoDef short cut (gd), this is handled by LSP client
  use 'hail2u/vim-css3-syntax'
  use 'jparise/vim-graphql'
  use 'leafgarland/typescript-vim'
  use 'othree/html5.vim'
  use 'pangloss/vim-javascript'
  use 'peitalin/vim-jsx-typescript'
  use 'prettier/vim-prettier'
  use 'stephpy/vim-yaml'
  use 'styled-components/vim-styled-components'
  use 'tbastos/vim-lua'
end)
