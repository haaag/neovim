-- settings.lua
local indent = 2

vim.o.clipboard = 'unnamedplus' -- clipboard
vim.o.hlsearch = false -- Set highlight on search
vim.o.mouse = 'a' -- Enable mouse mode
vim.o.swapfile = false -- No swap file
vim.o.backup = false -- No backup file
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath('state') .. '/undodir'
vim.o.undolevels = 10000
vim.o.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.o.smartcase = true -- Case insensitive searching UNLESS /C or capital in search
vim.o.signcolumn = 'yes' -- Signcolumn
vim.o.breakindent = true -- Enable break indent
vim.o.smartindent = true -- Insert indents automatically
vim.o.shiftround = true -- Round indent
vim.o.shiftwidth = indent -- Size of an indent
vim.o.tabstop = indent -- Number of spaces tabs count for
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.cmdheight = 0 -- More space for displaying messages
vim.o.showtabline = 1 -- Disable tabline
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.splitright = true -- Vertical splits will automatically be to the right
vim.o.laststatus = 3 -- Always display the status line
vim.o.showmode = false -- We don't need to see things like -- INSERT -- anymore
vim.o.dictionary = '/usr/share/dict/words' -- EN Dictionary - <CTRL-X><CTRL-K>
vim.o.number = true -- set numbered lines
vim.o.relativenumber = true -- set relative numbered lines
vim.o.timeoutlen = 500 -- Time in milliseconds to wait for a mapped sequence to complete.
vim.o.updatetime = 200 -- Decrease update time
vim.g.python3_host_prog = os.getenv('HOME') .. '/.local/debugpy/bin/python' -- command to start python3
vim.o.pumheight = 10 -- Maximum number of entries in a popup
vim.o.scrolloff = 0 -- Lines of context
vim.o.wrap = false -- Disable line wrap
vim.o.termguicolors = true -- True color support
vim.opt.spelllang = { 'en_us', 'es' } -- spellcheck
vim.o.cursorline = false -- Enable highlighting of the current line
vim.o.grepformat = '%f:%l:%c:%m' -- grep
vim.o.grepprg = 'rg --vimgrep' -- grep
vim.o.formatoptions = 'jcroqlnt' -- tcqj
vim.o.conceallevel = 2 -- Hide * markup for bold and italic
vim.o.wildmode = 'longest:full,full' -- Command-line completion mode
vim.o.winminwidth = 5 -- Minimum window width
vim.o.pumblend = 10 -- Popup blend
vim.o.splitkeep = 'cursor' -- cursor, screen, topline, scroll behavior when opening, closing or resizing horizontal splits
vim.o.colorcolumn = '81'
vim.opt.shortmess:append({ C = false })
vim.opt.shortmess:append({ I = true }) -- Current: ixolfFtTOc
vim.opt.shortmess:append({ n = false })

vim.opt.fillchars:append('stl: ')
vim.opt.fillchars:append('eob: ')
vim.opt.fillchars:append('fold: ')
vim.opt.fillchars:append('foldopen: ')
vim.opt.fillchars:append('foldsep: ')
vim.opt.fillchars:append('foldclose:')

-- vim.opt.guicursor = {
--   'a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor',
--   'sm:block-blinkwait175-blinkoff150-blinkon175',
-- }
