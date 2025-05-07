-- lsp.config
return {
  { -- https://github.com/j-hui/fidget.nvim
    'j-hui/fidget.nvim',
    event = 'LspAttach',
    opts = {
      notification = {
        window = { winblend = 0 },
      },
    },
    enabled = true,
  },

  { -- https://github.com/williamboman/mason.nvim
    'williamboman/mason.nvim',
    cmd = 'Mason',
    build = ':MasonUpdate',
    enabled = true,
    opts_extend = { 'ensure_installed' },
    opts = {
      ui = {
        icons = {
          package_installed = '',
          package_pending = '➜',
          package_uninstalled = '',
        },
      },
      ensure_installed = {
        'checkmake',
        'prettier',
      },
    },
    ---@param opts MasonSettings | {ensure_installed: string[]}
    config = function(_, opts)
      require('mason').setup(opts)
      local mr = require('mason-registry')
      mr.refresh(function()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end)
    end,
  },

  { -- https://github.com/b0o/SchemaStore.nvim
    'b0o/SchemaStore.nvim',
    enable = true,
  },
}
