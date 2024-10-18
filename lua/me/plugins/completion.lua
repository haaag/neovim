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
      },
      kind_icons = Core.icons.lsp.kinds,
      keymap = {
        show = '<C-space>',
        hide = '<C-e>',
        accept = '<C-y>',
        select_prev = { '<C-p>' },
        select_next = { '<C-n>' },
        show_documentation = {},
        hide_documentation = {},
        scroll_documentation_up = '<C-b>',
        scroll_documentation_down = '<C-f>',
        snippet_forward = '<Tab>',
        snippet_backward = '<S-Tab>',
      },
      sources = {
        -- similar to nvim-cmp's sources, but we point directly to the source's lua module
        -- multiple groups can be provided, where it'll fallback to the next group if the previous
        -- returns no completion items
        -- WARN: This API will have breaking changes during the beta
        providers = {
          { 'blink.cmp.sources.path', name = 'Path', score_offset = 3 },
          { 'blink.cmp.sources.lsp', name = 'LSP' },
          { 'blink.cmp.sources.snippets', name = 'Snippets', score_offset = -3 },
          { 'blink.cmp.sources.buffer', name = 'Buffer', fallback_for = { 'LSP' } },
        },
      },
    },
  },
}
