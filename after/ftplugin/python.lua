local hl = vim.api.nvim_set_hl

vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4

hl(0, '@constant.python', { link = 'Purple', default = true })
hl(0, '@keyword.return.python', { link = 'RedItalic', default = true })
hl(0, '@keyword.conditional.python', { link = 'RedItalic', default = true })
hl(0, '@keyword.exception.python', { link = 'RedItalic', default = true })

-- https://neovim.io/doc/user/fold.html#fold-indent
-- vim.opt_local.foldmethod = 'indent'
