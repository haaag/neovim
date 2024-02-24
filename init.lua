-- init.lua

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- global envs
NVIM_DEBUG = os.getenv('DEBUG') or false
NVIM_TEST = os.getenv('TEST') or false

require('me.config.lazy')
require('me.config.options')

vim.api.nvim_create_autocmd('User', {
  pattern = 'VeryLazy',
  callback = function()
    require('me.config.autocmd')
    require('me.config.keymaps')
  end,
})
