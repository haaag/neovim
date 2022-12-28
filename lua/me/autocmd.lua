-- autocmd.lua
--------------

local misc = vim.api.nvim_create_augroup("Misc", { clear = true })

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function() vim.highlight.on_yank() end,
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
vim.api.nvim_create_autocmd("BufReadPre", {
  group = misc,
  pattern = "*",
  callback = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "<buffer>",
      once = true,
      callback = function()
        vim.cmd(
          [[if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif]]
        )
      end,
    })
  end,
})

-- Automatically source and re-compile packer whenever you save this init.lua
--[[ local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = "packer.lua",
  desc = 'Automatically source and re-compile packer whenever you save this init.lua'
}) ]]
