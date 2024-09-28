local set = vim.opt_local
local hl = vim.api.nvim_set_hl

set.expandtab = true
set.tabstop = 4
set.shiftwidth = 4

hl(0, '@constant.bash', { link = 'PurpleItalic', default = true })
hl(0, '@keyword.conditional.bash', { link = 'RedItalic', default = true })
hl(0, '@keyword.repeat.bash', { link = 'RedItalic', default = true })
hl(0, '@keyword.import.bash', { link = 'RedItalic', default = true })
