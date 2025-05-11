vim.o.makeprg = 'go build'
vim.opt.textwidth = 79
vim.opt.formatprg = ''

vim.api.nvim_set_hl(0, '@constant.go', { link = 'Purple', default = true })
