-- autocmd.lua

local function augroup(name)
  return vim.api.nvim_create_augroup("me_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
  desc = "Highlight on yank",
})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = augroup("sxhkd_group"),
  pattern = "*sxhkdrc",
  command = "!pkill -USR1 sxhkd",
  desc = "Update binds when sxhkdrc is updated.",
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("easy_close_q"),
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "startuptime", "netrw" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
  desc = "Use 'q' to quit from common plugins",
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_location"),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
  desc = "go to last loc when opening a buffer",
})

-- vim.api.nvim_create_autocmd("FileType", {
--   group = augroup("wrap_spell"),
--   pattern = { "gitcommit", "markdown" },
--   callback = function()
--     vim.opt_local.wrap = true
--     vim.opt_local.spell = true
--     -- vim.g.markdown_recommended_style = 0
--     -- require("me.config.utils").toggle_numbers()
--     require("me.config.utils").toggle_all()
--   end,
-- })

vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
  desc = "resize splits if window got resized",
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = augroup("Xresources"),
  pattern = { "*xdefaults", "*Xresources", "*.xresources" },
  command = "!xrdb -load ~/.Xresources",
  desc = "Reload Xresources after buffer write",
})

vim.api.nvim_create_autocmd({
  "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
  "BufWinEnter",
  "CursorHold",
  "InsertLeave",
  "BufWritePost",
  "TextChanged",
  "TextChangedI",
}, {
  group = vim.api.nvim_create_augroup("barbecue.updater", {}),
  callback = function()
    require("barbecue.ui").update()
  end,
  desc = "Gain better performance when moving the cursor around",
})

-- vim.api.nvim_create_autocmd({ "TermOpen" }, {
--   group = augroup("open_term"),
--   callback = function()
--     local opts = { noremap = true }
--     vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
--     vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
--     vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
--     vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
--     vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
--   end,
-- })
