-- autocmd.lua

local misc = vim.api.nvim_create_augroup("Misc", { clear = true })

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- Update binds when sxhkdrc is updated.
local sxhkd_group = vim.api.nvim_create_augroup("SxhkdGroup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = sxhkd_group,
  pattern = "*sxhkdrc",
  command = "!pkill -USR1 sxhkd",
  desc = "Update binds when sxhkdrc is updated.",
})

-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = misc,
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "startuptime", "netrw" },
  command = [[nnoremap <buffer><silent> q :quit<CR>]],
  desc = "Use 'q' to quit from common plugins",
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
