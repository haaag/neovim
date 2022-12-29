-- init.lua

vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

require("me.lazy")
require("me.settings")

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("me.autocmd")
    require("me.nmaps")
  end,
})
