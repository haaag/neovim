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
    { import = 'me.plugins.lsp.servers.lualang' },
    { import = 'me.plugins.lsp.servers.golang' },
    { import = 'me.plugins.lsp.servers.basedpyright' },
    { import = 'me.plugins.lsp.servers.typescript' },
    -- { import = 'me.plugins.lsp.servers.pyright' },
    -- { import = 'me.plugins.lsp.servers.pylsp' },
    -- { import = 'me.plugins.lsp.servers.json' },
  },
  defaults = { lazy = false },
  install = { colorscheme = { 'catppuccin' } },
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
        'matchit',
        -- "matchparen",
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})
