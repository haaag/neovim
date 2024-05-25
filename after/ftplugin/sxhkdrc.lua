local Utils = require('me.config.utils')
local autocmd = vim.api.nvim_create_autocmd

autocmd('BufWritePost', {
  group = Utils.augroup('sxhkd_group'),
  pattern = '*sxhkdrc',
  command = '!pkill -USR1 sxhkd',
  desc = 'update binds when sxhkdrc is updated.',
})
