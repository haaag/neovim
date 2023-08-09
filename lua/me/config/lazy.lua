-- lazy.bootstrap

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '--single-branch',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require('lazy').setup({
  spec = {
    { import = 'me.plugins' },
    { import = 'me.plugins.lsp.servers.efm' },
    { import = 'me.plugins.lsp.servers.extras.lua_ls' },
    { import = 'me.plugins.lsp.servers.extras.pylsp' },
    -- { import = "me.plugins.lsp.servers.extras.pyright" },
    -- { import = "me.plugins.lsp.servers.extras.json" },
    -- { import = "me.plugins.lsp.servers.extras.typescript" },
    -- { import = "me.plugins.lsp.servers.extras.go_ls" },
  },
  defaults = { lazy = false },
  install = { colorscheme = { 'tokyonight' } },
  checker = { enabled = false },
  diff = {
    cmd = 'terminal_git',
  },
  performance = {
    cache = {
      enabled = true,
      -- disable_events = {},
    },
    rtp = {
      disabled_plugins = {
        'gzip',
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})
