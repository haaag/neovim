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
      highlight = {
        use_nvim_cmp_as_default = true,
      },
      nerd_font_variant = 'mono', -- 'normal'
      completion = {
        menu = {
          border = vim.g.floating_window_border,
        },
        documentation = {
          auto_show = true,
          window = {
            border = vim.g.floating_window_border,
          },
        },
      },
      windows = {
        ghost_text = {
          enabled = true,
        },
      },
      kind_icons = Core.icons.lsp.kinds,
      keymap = { preset = 'default' },
      signature = { enabled = true },
    },
  },
}
