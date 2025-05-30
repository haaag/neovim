-- settings.lua
local opt = vim.opt

-- follow the <leader>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- colorscheme
vim.o.background = 'light'

-- stylua: ignore start
opt.clipboard     = 'unnamedplus' -- clipboard
opt.hlsearch      = false         -- Set highlight on search
opt.mouse         = 'a'           -- Enable mouse mode
opt.swapfile      = false         -- No swap file
opt.backup        = false         -- No backup file
opt.undofile      = true
opt.undodir       = vim.fn.stdpath('state') .. '/undodir'
opt.undolevels    = 10000
opt.ignorecase    = true          -- Case insensitive searching UNLESS /C or capital in search
opt.smartcase     = true          -- Case insensitive searching UNLESS /C or capital in search
opt.signcolumn    = 'yes'         -- Signcolumn
opt.breakindent   = true          -- Enable break indent
opt.smartindent   = true          -- Insert indents automatically
opt.shiftround    = true          -- Round indent
opt.shiftwidth    = 2             -- Size of an indent
opt.tabstop       = 2             -- Number of spaces tabs count for
opt.expandtab     = true          -- Use spaces instead of tabs
opt.cmdheight     = 1             -- More space for displaying messages
opt.showtabline   = 1             -- Disable tabline
opt.splitbelow    = true          -- Horizontal splits will automatically be below
opt.splitright    = true          -- Vertical splits will automatically be to the right
opt.laststatus    = 0             -- Always display the status line
opt.showmode      = true          -- We don't need to see things like -- INSERT -- anymore
opt.dictionary    = '/usr/share/dict/words' -- EN Dictionary - <CTRL-X><CTRL-K>
opt.number        = false         -- set numbered lines
opt.relativenumber= false         -- set relative numbered lines
opt.timeoutlen    = 500           -- Time in milliseconds to wait for a mapped sequence to complete.
opt.updatetime    = 200           -- Decrease update time
opt.pumheight     = 18            -- Maximum number of entries in a popup
opt.scrolloff     = 10            -- Lines of context
opt.sidescrolloff = 10            -- Lines of context
opt.wrap          = false         -- Disable line wrap
opt.termguicolors = true          -- True color support
opt.spelllang     = { 'en_us', 'es' } -- spellcheck
opt.cursorline    = false         -- Enable highlighting of the current line
opt.grepformat    = '%f:%l:%c:%m' -- grep
opt.grepprg       = 'rg --vimgrep'-- grep
opt.conceallevel  = 1             -- Hide * markup for bold and italic
opt.wildmode      = 'longest:full,full' -- Command-line completion mode
opt.winminwidth   = 5             -- Minimum window width
opt.pumblend      = 10            -- Popup blend
opt.splitkeep     = 'cursor'      -- cursor, screen, topline, scroll behavior when opening, closing or resizing horizontal splits
opt.list          = false         -- Show some invisible characters (tabs...
opt.listchars     = { tab = '» ', trail = '·', nbsp = '␣' }
opt.inccommand    = "nosplit"     -- preview incremental substitute
opt.confirm       = true          -- Confirm to save changes before exiting modified buffer
opt.showbreak     = '↪'
opt.smoothscroll  = true
opt.foldmethod    = 'expr'
-- opt.foldminlines  = 0             -- Allow closing even 1-line folds.
opt.foldexpr      = 'v:lua.Core.fold.expr(v:lnum)'
-- opt.foldtext      = 'v:lua.Core.fold.text()'
-- opt.foldexpr      = "nvim_treesitter#foldexpr()"
opt.foldenable    = false
-- others: {{{
-- see :h shortmess
opt.shortmess:append({
  W = true,   -- don't give "written" or "[w]" when writing a file
  I = false,  -- don't give the intro message when starting Vim
  c = true,   -- don't give |ins-completion-menu| messages
  C = true,   -- don't give messages while scanning for ins-completion items, for instance "scanning tags"
})
opt.fillchars = {
  diff = '╱',
  eob = '~',
  fold = ' ',
  foldclose = '',
  foldopen = '',
  foldsep = ' ',
}

opt.formatoptions = 'jcroqlnt'
-- j – auto-remove comment leaders when joining lines (e.g., removes -- in Lua).
-- c – auto-wrap comments using textwidth.
-- r – insert comment leader (--, #, etc.) automatically when pressing <Enter> in a comment.
-- o – insert comment leader when using o or O in normal mode.
-- q – allow gq to format comments with textwidth.
-- l – do not break lines that are longer than textwidth if they have a long word.
-- n – recognize numbered lists and indent properly.
-- t – auto-wrap normal text (not in comments) to textwidth.

opt.winborder     = 'single'     -- Defines the default border style of floating windows
vim.g.python3_host_prog = os.getenv('HOME') .. '/.local/debugpy/bin/python'
vim.g.loaded_perl_provider = 0
vim.g.enable_autoformat = false

-- cursor block
vim.opt.guicursor = {
  'a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor',
  'sm:block-blinkwait175-blinkoff150-blinkon175',
}

-- types
local ft = vim.filetype
ft.add({
  extension = { scratchpad = 'scratchpad' },
  filename = { ['Scratchpad'] = 'scratchpad' },
  pattern = { ['%.scratchpad$'] = 'scratchpad' },
})
ft.add({
  extension = { gomarks = 'gomarks' },
  pattern = { ['%.gomarks$'] = 'gomarks' },
})
