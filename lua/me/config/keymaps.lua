-- keymaps

local options = { noremap = true, silent = true }
local silent = { silent = true }
local map = vim.keymap.set

-- Keymaps for better default experience
-- vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Shortcut to use blackhole register by default
vim.keymap.set('v', 'd', '"_d', options)
vim.keymap.set('v', 'D', '"_D', options)
vim.keymap.set('v', 'c', '"_c', options)
vim.keymap.set('v', 'C', '"_C', options)
vim.keymap.set('v', 'x', '"_x', options)
vim.keymap.set('v', 'X', '"_X', options)
vim.keymap.set('n', 'd', '"_d', options)
vim.keymap.set('n', 'D', '"_D', options)
vim.keymap.set('n', 'c', '"_c', options)
vim.keymap.set('n', 'C', '"_C', options)
vim.keymap.set('n', 'x', '"_x', options)
vim.keymap.set('n', 'X', '"_X', options)

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Use ctlr + hjkl to resize windows:
map('n', '<C-j>', ':resize -2<CR>', options)
map('n', '<C-S-k>', ':resize +2<CR>', options)
map('n', '<C-h>', ':vertical resize -2<CR>', options)
map('n', '<C-l>', ':vertical resize +2<CR>', options)

-- Keep search results centred
map('n', 'n', 'nzzzv', silent)
map('n', 'N', 'Nzzzv', silent)

-- Make Y yank to end of the line
map('n', 'Y', 'y$', silent)

-- Move lines
map('v', 'K', ":move '<-2<CR>gv-gv", {})
map('v', 'J', ":move '>+1<CR>gv-gv", {})

-- C-d 'n C-u centred
map('n', '<C-d>', '<C-d>zz', silent)
map('n', '<C-u>', '<C-u>zz', silent)

-- buffers
map('n', '<M-}>', '<CMD>bnext<CR>', { desc = 'Next buffer' })
map('n', '<M-{>', '<CMD>bprevious<CR>', { desc = 'Previous buffer' })
map('n', '<C-S-]>', '<CMD>bnext<CR>', { desc = 'Next buffer' })
map('n', '<C-S-[>', '<CMD>bprevious<CR>', { desc = 'Previous buffer' })
map('n', '<C-Left>', '<CMD>bprevious<CR>', { desc = 'Previous buffer' })
map('n', '<C-Right>', '<CMD>bnext<CR>', { desc = 'Next buffer' })
map('n', '<leader>qq', '<CMD>q<CR>', { desc = '[Q]uit' })

-- files
map('n', '<leader>eb', '<CMD>e ~/apps/vimwiki/cookbook/cookbook.md<CR>', { desc = '[E]dit Cook[b]ook' })
map('n', '<leader>ew', '<CMD>e ~/apps/vimwiki/index.md<CR>', { desc = '[E]dit Vim[W]iki' })
map('n', '<leader>ez', '<CMD>e ~/.config/zsh/.zshrc<CR>', { desc = '[E]dit [Z]shrc' })
map('n', '<leader>ex', '<CMD>e ~/.Xresources<CR>', { desc = '[E]dit [X]resources' })
map('n', '<leader>es', '<CMD>e ~/.config/sxhkd/sxhkdrc<CR>', { desc = '[E]dit [S]xhkdrc' })

-- quickfix
map('n', '<leader>qc', '<CMD>cclose<CR>', { desc = '[Q]uickfix [C]lose' })
map('n', '<leader>qo', '<CMD>copen<CR>', { desc = '[Q]uickfix [O]pen' })
map('n', '<leader>qg', '<CMD>cfirst<CR>', { desc = '[Q]uickfix First' })
map('n', '<leader>qG', '<CMD>clast<CR>', { desc = '[Q]uickfix Last' })

-- personal
map('n', '<leader>wn', function()
  require('me.config.utils').toggle_numbers()
end, { desc = 'Toggle [N]umber' })

map('n', '<leader>wd', function()
  require('me.plugins.lsp.diagnostic').toggle_diagnostics()
end, { desc = 'Toggle [D]iagnostics signs' })

map('n', '<leader>wg', function()
  require('gitsigns').toggle_signs()
end, { desc = 'Toggle [G]it signs' })

map('n', '<leader>wa', function()
  require('me.config.utils').toggle_all()
end, { desc = 'Toggle [A]all' })

vim.keymap.set('n', '<leader>go', vim.cmd.Git)

-- map("n", "<S-A-CR>", ":TermExec cmd='python %' size=10 direction=horizontal <CR>")

--[[ map("n", "<leader>bc", "<cmd>%bd|e#<cr>", { desc = "Close all buffers but the current one" })
-- https://stackoverflow.com/a/42071865/516188 ]]

-- disable the arrow keys
--[[ map({ "i", "n" }, "<Up>", "<NOP>")
map({ "i", "n" }, "<Down>", "<NOP>")
map({ "i", "n" }, "<Left>", "<NOP>")
map({ "i", "n" }, "<Right>", "<NOP>") ]]
