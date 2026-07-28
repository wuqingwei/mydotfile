
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug 'nvim-lualine/lualine.nvim'

vim.call('plug#end')

-- move config and plugin config to alternate files
require("plugins.lualine")
require('options')

require('keymaps')
