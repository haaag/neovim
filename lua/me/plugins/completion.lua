return {
  { -- https://github.com/Saghen/blink.cmp
    'saghen/blink.cmp',
    enabled = true,
    event = 'VeryLazy',
    lazy = false,
    dependencies = { -- https://github.com/rafamadriz/friendly-snippets
      'rafamadriz/friendly-snippets',
    },
    version = 'v0.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- See the full "keymap" documentation for information on defining your own keymap.
      keymap = { preset = 'default' },

      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- Will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono',
      },

      completion = {
        menu = {
          auto_show = function(ctx)
            return ctx.mode ~= 'cmdline'
          end,
          border = 'rounded',
          -- nvim-cmp style menu
          -- draw = {
          --   columns = {
          --     { 'label', 'label_description', gap = 1 },
          --     { 'kind_icon', gap = 1, 'kind' },
          --   },
          -- },
        },
        documentation = { auto_show = true, window = { border = 'rounded', scrollbar = false } },
      },
      cmdline = { enabled = false },
      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
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
      },
    },
    opts_extend = { 'sources.default' },
  },
}
