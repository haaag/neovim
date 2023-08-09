-- init.lua

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.coq_settings = { auto_start = 'shut-up' }

require('me.config.lazy')
require('me.config.options')

vim.api.nvim_create_autocmd('User', {
  pattern = 'VeryLazy',
  callback = function()
    require('me.config.autocmd')
    require('me.config.keymaps')
  end,
})
