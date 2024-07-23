local option = vim.api.nvim_set_option_value
local optlocal = vim.opt_local

optlocal.wrap = true
optlocal.spell = true

option('textwidth', 72, { scope = 'local' })
option('colorcolumn', '+0', { scope = 'local' })
