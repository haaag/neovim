-- keymaps

local map = vim.keymap.set
local options = { noremap = true, silent = true }
local silent = { silent = true }
local Util = require('me.config.utils')
local Toggle = require('me.config.toggle')

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
map('n', '<C-j>', ':horizontal resize -2<CR>', options)
map('n', '<C-k>', ':horizontal resize +2<CR>', options)

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
map('n', '<M-}>', '<CMD>bnext<CR>', { desc = 'next buffer' })
map('n', '<M-{>', '<CMD>bprevious<CR>', { desc = 'previous buffer' })
map('n', '<C-S-]>', '<CMD>bnext<CR>', { desc = 'next buffer' })
map('n', '<C-S-[>', '<CMD>bprevious<CR>', { desc = 'previous buffer' })
map('n', '<C-Left>', '<CMD>bprevious<CR>', { desc = 'previous buffer' })
map('n', '<C-Right>', '<CMD>bnext<CR>', { desc = 'next buffer' })
map('n', '<leader>qq', '<CMD>q<CR>', { desc = 'quit' })

-- files
map('n', '<leader>eb', '<CMD>e ~/apps/vimwiki/cookbook/cookbook.md<CR>', { desc = 'edit cookbook' })
map('n', '<leader>ew', '<CMD>e ~/apps/vimwiki/index.md<CR>', { desc = 'edit vimwiki' })
map('n', '<leader>ez', '<CMD>e ~/.config/zsh/.zshrc<CR>', { desc = 'edit zshrc' })
map('n', '<leader>ex', '<CMD>e ~/.Xresources<CR>', { desc = 'edit xresources' })
map('n', '<leader>es', '<CMD>e ~/.config/sxhkd/sxhkdrc<CR>', { desc = 'edit sxhkdrc' })

-- quickfix
map('n', '<leader>qc', '<CMD>cclose<CR>', { desc = 'quickfix close' })
map('n', '<leader>qo', '<CMD>copen<CR>', { desc = 'quickfix open' })
map('n', '<leader>qg', '<CMD>cfirst<CR>', { desc = 'quickfix first' })
map('n', '<leader>qG', '<CMD>clast<CR>', { desc = 'quickfix last' })

-- personal
-- stylua: ignore start
map("n", '<leader>bb', function() Toggle.scrollsync() end, { desc = 'scrolling synchronously'})
map('n', '<leader>bC', '<CMD>TSContextToggle<CR>', { desc = 'toggle treesitter context' })
map('n', '<leader>bi', function() Toggle.inlay_hints() end, { desc = 'toggle inlay hints' })
map('n', '<leader>bg', function() Toggle.gitsings() end, { desc = 'toggle git signs' })
map('n', '<leader>bl', function() Toggle.statusline() end, { desc = 'toggle statusline' })
map('n', '<leader>bL', function() Toggle.laststatus() end, { desc = 'set laststatus' })
map('n', '<leader>bM', function() Toggle.minimalist() end, { desc = 'toggle minimalist' })
map('n', '<leader>bn', function() Toggle.numbers() end, { desc = 'toggle numbers' })
map('n', '<leader>bs', function() Toggle.diagnostic_signs() end, { desc = 'toggle diagnostics signs' })
map('n', '<leader>bS', function() Toggle.signcolumn() end, { desc = 'toggle signcolumn' })
map('n', '<leader>ma', function() Util.set_root() end, { desc = 'set current root' })

-- LSP
-- map('n', '<leader>ls', '<CMD>LspStart<CR>', { desc = 'lsp start' })
