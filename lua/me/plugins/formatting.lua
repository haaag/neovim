-- formatters

local goimports = {
  args = { '-rm-unused', '-set-alias', '-format', '$FILENAME' },
}

return {
  { -- https://github.com/stevearc/conform.nvim
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    enabled = true,
    -- stylua: ignore
    keys = {
      { '<leader>lF', function() Core.toggle.fmt_on_save() end, desc = 'toggle fmt on save' },
      {
        "<leader>lf",
        function()
          require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 1000 })
        end,
        mode = { "n", "v" },
        desc = "format file or range (in visual mode)",
      },
    },
    config = function()
      local conform = require('conform')
      conform.formatters['goimports-reviser'] = goimports
      conform.setup({
        formatters_by_ft = {
          ['_'] = { 'trim_whitespace' },
          ['css'] = { 'prettier' },
          ['go'] = { 'goimports-reviser', 'gofumpt', 'golines' },
          ['html'] = { 'prettier' },
          ['javascript'] = { 'prettier' },
          ['javascriptreact'] = { 'prettier' },
          ['json'] = { 'prettier' },
          ['jsonc'] = { 'prettier' },
          ['lua'] = { 'stylua' },
          ['markdown'] = { 'prettier' },
          ['markdown.mdx'] = { 'prettier' },
          ['python'] = { 'ruff_format', 'ruff_organize_imports' },
          ['sh'] = { 'shfmt' },
          ['sql'] = { 'sleek' },
          ['typescript'] = { 'prettier' },
          ['typescriptreact'] = { 'prettier' },
          ['yaml'] = { 'prettier' },
        },

        formatters = {
          injected = { options = { ignore_errors = true } },
        },

        format_on_save = function(_)
          if not vim.g.enable_autoformat then
            return
          end

          return { timeout_ms = 500, lsp_format = 'fallback', lsp_fallback = true }
        end,
      })
    end,
  },
}
