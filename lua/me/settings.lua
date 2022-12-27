-- settings.lua

-- [[ basic settings ]]
local HOME = tostring(os.getenv("HOME"))

-- clipboard
vim.o.clipboard = "unnamedplus"

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.swapfile = false
vim.o.undofile = true
vim.o.undodir = HOME .. "/.config/nvim/undodir"

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- More space for displaying messages
vim.o.cmdheight = 0

-- Horizontal splits will automatically be below
vim.o.splitbelow = true

-- Vertical splits will automatically be to the right
vim.o.splitright = true

-- Always display the status line
vim.o.laststatus = 3

-- We don't need to see things like -- INSERT -- anymore
vim.o.showmode = false

-- EN Dictionary - <CTRL-X><CTRL-K>
vim.o.dictionary = "/usr/share/dict/words"

-- Disable Highlight search
vim.o.hlsearch = false

-- set numbered lines
vim.o.number = true

-- set relative numbered lines
vim.o.relativenumber = true

-- Time in milliseconds to wait for a mapped sequence to complete.
vim.o.timeoutlen = 500

-- faster scrolling
vim.o.lazyredraw = true

-- [[ basic keymaps ]]
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

-- command to start python3
vim.g.python3_host_prog = HOME .. "/.local/debugpy/bin/python"

-- Maximum number of entries in a popup
vim.opt.pumheight = 10

-- Lines of context
vim.opt.scrolloff = 4

-- vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"
