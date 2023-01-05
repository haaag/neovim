-- settings.lua
local HOME = tostring(os.getenv("HOME"))
local indent = 2

vim.o.clipboard = "unnamedplus" -- clipboard
vim.o.hlsearch = false -- Set highlight on search
vim.o.mouse = "a" -- Enable mouse mode
vim.o.swapfile = false -- No swap file
vim.o.backup = false -- no backup file
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath("state") .. "/undodir"
vim.o.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.o.smartcase = true -- Case insensitive searching UNLESS /C or capital in search
vim.o.updatetime = 250 -- Decrease update time
vim.wo.signcolumn = "yes" -- Signcolumn
vim.o.breakindent = true -- Enable break indent
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.shiftround = true -- Round indent
vim.opt.shiftwidth = indent -- Size of an indent
vim.opt.tabstop = indent -- Number of spaces tabs count for
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.o.cmdheight = 0 -- More space for displaying messages
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.splitright = true -- Vertical splits will automatically be to the right
vim.o.laststatus = 3 -- Always display the status line
vim.o.showmode = false -- We don't need to see things like -- INSERT -- anymore
vim.o.dictionary = "/usr/share/dict/words" -- EN Dictionary - <CTRL-X><CTRL-K>
vim.o.number = true -- set numbered lines
vim.o.relativenumber = true -- set relative numbered lines
vim.o.timeoutlen = 500 -- Time in milliseconds to wait for a mapped sequence to complete.
vim.g.python3_host_prog = HOME .. "/.local/debugpy/bin/python" -- command to start python3
vim.opt.pumheight = 10 -- Maximum number of entries in a popup
vim.opt.scrolloff = 4 -- Lines of context
vim.opt.wrap = false -- Disable line wrap
vim.opt.termguicolors = true -- True color support
vim.opt.spelllang = { "en", "es" } -- spellcheck
-- vim.opt.cursorline = false -- Enable highlighting of the current line
-- vim.opt.hidden = true -- Enable modified buffers in background
-- vim.opt.grepprg = "rg --vimgrep" -- grep
-- vim.opt.grepformat = "%f:%l:%c:%m" -- grep
-- vim.opt.splitkeep = "screen" -- Uknown

-- vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"
