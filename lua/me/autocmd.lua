-- [[ autocmd.lua ]]

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


local sxhkd_group = vim.api.nvim_create_augroup("SxhkdGroup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = sxhkd_group,
  pattern = "*sxhkdrc",
  command = "!pkill -USR1 sxhkd",
  desc = "Update binds when sxhkdrc is updated.",
})

local misc = vim.api.nvim_create_augroup("Misc", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = misc,
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "startuptime" },
  command = [[nnoremap <buffer><silent> q :quit<CR>]],
  desc = "Use 'q' to quit from common plugins",
})
