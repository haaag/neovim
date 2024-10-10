return {
  { -- https://github.com/Saghen/blink.cmp
    'saghen/blink.cmp',
    enabled = true,
    event = 'InsertEnter',
    lazy = false, -- lazy loading handled internally
    dependencies = { -- https://github.com/rafamadriz/friendly-snippets
      'rafamadriz/friendly-snippets',
    },

    -- use a release tag to download pre-built binaries
    version = 'v0.*',
    -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',

    opts = {
      highlight = {
        -- sets the fallback highlight groups to nvim-cmp's highlight groups
        -- useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release, assuming themes add support
        use_nvim_cmp_as_default = false,
      },
      -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'normal',

      -- experimental auto-brackets support
      accept = { auto_brackets = { enabled = false } },
      -- experimental signature help support
      trigger = { signature_help = { enabled = false } },

      windows = {
        autocomplete = {
          draw = 'reversed',
          border = 'rounded',
        },
        documentation = {
          border = 'rounded',
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
