-- keymaps

local map = vim.keymap.set
local options = { noremap = true, silent = true }
local silent = { silent = true }
local Util = require('me.config.utils')

-- shortcut to use blackhole register by default
map('v', 'd', '"_d', options)
map('v', 'D', '"_D', options)
map('v', 'c', '"_c', options)
map('v', 'C', '"_C', options)
map('v', 'x', '"_x', options)
map('v', 'X', '"_X', options)
map('n', 'd', '"_d', options)
map('n', 'D', '"_D', options)
map('n', 'c', '"_c', options)
map('n', 'C', '"_C', options)
map('n', 'x', '"_x', options)
map('n', 'X', '"_X', options)

-- remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- use ctlr + hjkl to resize windows:
map('n', '<C-h>', ':vertical resize -2<CR>', options)
map('n', '<C-l>', ':vertical resize +2<CR>', options)

-- keep search results centred
map('n', 'n', 'nzzzv', silent)
map('n', 'N', 'Nzzzv', silent)

-- make y yank to end of the line
map('n', 'Y', 'y$', silent)

-- move lines
map('v', 'K', ":move '<-2<CR>gv-gv", {})
map('v', 'J', ":move '>+1<CR>gv-gv", {})

-- c-d 'n c-u centred
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
end, { desc = 'Toggle Number' })

map('n', '<leader>wd', function()
  require('me.plugins.lsp.diagnostic').toggle_diagnostics()
end, { desc = 'Toggle Diagnostics signs' })

map('n', '<leader>wg', function()
  require('gitsigns').toggle_signs()
end, { desc = 'Toggle Git signs' })

map('n', '<leader>wa', function()
  require('me.config.utils').toggle_all()
end, { desc = 'Toggle Aall' })

map('n', '<leader>ma', function()
  Util.set_root()
end, { desc = 'Set current root' })
