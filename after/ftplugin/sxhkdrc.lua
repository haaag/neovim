vim.api.nvim_create_autocmd('BufWritePost', {
  group = Core.augroup('sxhkd_group'),
  pattern = '*sxhkdrc',
  command = '!pkill -USR1 sxhkd',
  desc = 'update binds when sxhkdrc is updated.',
})
