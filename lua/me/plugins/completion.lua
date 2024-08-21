return {
  { -- https://github.com/hrsh7th/nvim-cmp
    'hrsh7th/nvim-cmp',
    version = false,
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-buffer', -- https://github.com/hrsh7th/cmp-buffer
      'hrsh7th/cmp-path', -- https://github.com/hrsh7th/cmp-path
      'hrsh7th/cmp-nvim-lsp', -- https://github.com/hrsh7th/cmp-nvim-lsp
      'davidsierradz/cmp-conventionalcommits', -- https://github.com/davidsierradz/cmp-conventionalcommits
      'saadparwaiz1/cmp_luasnip', -- https://github.com/saadparwaiz1/cmp_luasnip
    },
    main = 'me.config.plugins.cmp',
    config = true,
  },
  { -- https://github.com/L3MON4D3/LuaSnip
    'L3MON4D3/LuaSnip',
    event = 'InsertEnter',
    dependencies = { -- https://github.com/rafamadriz/friendly-snippets
      'rafamadriz/friendly-snippets',
    },
    version = 'v2.*',
    build = 'make install_jsregexp',
    main = 'me.config.plugins.luasnip',
    config = true,
    enabled = Core.is_executable('make'),
  },
}
