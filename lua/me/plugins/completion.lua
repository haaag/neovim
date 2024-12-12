return {
  { -- https://github.com/Saghen/blink.cmp
    'saghen/blink.cmp',
    enabled = true,
    event = 'InsertEnter',
    lazy = false,
    dependencies = { -- https://github.com/rafamadriz/friendly-snippets
      'rafamadriz/friendly-snippets',
    },
    version = 'v0.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      completion = {
        menu = {
          -- auto_show = false,
          -- draw = {
          --   columns = { { 'label', 'label_description', gap = 1 }, { 'kind_icon', gap = 1, 'kind' } },
          -- },
          border = vim.g.floating_window_border,
        },
        documentation = {
          auto_show = true,
          window = {
            border = vim.g.floating_window_border,
          },
        },
        ghost_text = { enabled = false },
      },
      sources = {
        default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
        -- Remove 'buffer' if you don't want text completions, by default it's only enabled when LSP returns no items
        -- default = { 'lsp', 'path', 'snippets', 'buffer' },
        -- Disable cmdline completions
        cmdline = {},
      },
      appearance = {
        -- kind_icons = Core.icons.lsp.kinds,
        nerd_font_variant = 'mono', -- 'normal'
        use_nvim_cmp_as_default = true,
      },
      keymap = { preset = 'default' },
      signature = { enabled = true },
    },
  },
}
