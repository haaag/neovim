local option = vim.api.nvim_set_option_value
vim.opt_local.wrap = true
vim.opt_local.spell = true
option('textwidth', 72, { scope = 'local' })
option('colorcolumn', '+0', { scope = 'local' })
