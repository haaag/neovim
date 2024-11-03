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
      accept = { auto_brackets = { enabled = false } },
      trigger = { signature_help = { enabled = true } },
      windows = {
        autocomplete = {
          draw = 'reversed',
          border = vim.g.floating_window_border,
        },
        documentation = {
          border = vim.g.floating_window_border,
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        ghost_text = {
          enabled = true,
        },
      },
      kind_icons = Core.icons.lsp.kinds,
      keymap = 'default',
    },
  },
}
