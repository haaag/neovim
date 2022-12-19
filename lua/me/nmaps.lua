-- [[ keymaps ]]

local options = { noremap = true, silent = true }
local silent = { silent = true }

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Use alt + hjkl to resize windows:
vim.keymap.set("n", "<C-j>", ":resize -2<CR>", options)
vim.keymap.set("n", "<C-k>", ":resize +2<CR>", options)
vim.keymap.set("n", "<C-l>", ":vertical resize -2<CR>", options)
vim.keymap.set("n", "<C-h>", ":vertical resize +2<CR>", options)

-- Keep search results centred
vim.keymap.set("n", "n", "nzzzv", silent)
vim.keymap.set("n", "N", "Nzzzv", silent)

-- Make Y yank to end of the line
vim.keymap.set("n", "Y", "y$", silent)

-- Move lines
vim.keymap.set("v", "K", ":move '<-2<CR>gv-gv", {})
vim.keymap.set("v", "J", ":move '>+1<CR>gv-gv", {})

-- C-d n C-u centred
vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {})

-- buffers
vim.keymap.set("n", "<leader>bd", "<CMD>bdelete<CR>", { desc = "Buffer close" })
vim.keymap.set("n", "<leader>bo", "<CMD>only<CR>", { desc = "Buffer only" })
vim.keymap.set("n", "<M-}>", "<CMD>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<M-{>", "<CMD>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bp", "<CMD>BufferLinePick<CR>", { desc = "[P]ick [B]uffer" })
-- vim.keymap.set("n", "<leader>b]", "<CMD>BufferLineCycleNext<CR>", { desc = "Next buffer" })
-- vim.keymap.set("n", "<leader>", "<CMD>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
--
