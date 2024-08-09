-- lsp.servers.luad_ls
return {
  { -- https://github.com/neovim/nvim-lspconfig
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        lua_ls = {
          autostart = true,
          on_attach = function(client, _)
            client.server_capabilities.semanticTokensProvider = nil
          end,
          settings = {
            Lua = {
              format = { enable = false },
              telemetry = { enable = false },
              workspace = { checkThirdParty = false },
              completion = { callSnippet = 'Replace' },
              hint = { enable = true },
              diagnostics = {
                enable = true,
                globals = {
                  'vim',
                  'xplr',
                },
              },
            },
          },
        },
      },
    },
  },

  { -- https://github.com/nvim-treesitter/nvim-treesitter
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, { 'lua', 'luadoc', 'luap' })
      end
    end,
  },

  { -- https://github.com/williamboman/mason.nvim
    'williamboman/mason.nvim',
    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, { 'stylua' })
      end
    end,
  },
}
