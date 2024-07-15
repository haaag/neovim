return {
  { -- https://github.com/hrsh7th/nvim-cmp
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'davidsierradz/cmp-conventionalcommits',
      'lukas-reineke/cmp-under-comparator',
      'saadparwaiz1/cmp_luasnip',
    },
    main = 'me.config.plugins.cmp',
    config = true,
  },
  { -- https://github.com/L3MON4D3/LuaSnip
    'L3MON4D3/LuaSnip',
    event = 'VeryLazy',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = 'v2.*',
    build = 'make install_jsregexp',
    main = 'me.config.plugins.luasnip',
    config = true,
  },
}
