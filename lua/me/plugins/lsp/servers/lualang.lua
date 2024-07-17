-- lsp.servers.luad_ls
return {
  {
    'neovim/nvim-lspconfig', -- https://github.com/neovim/nvim-lspconfig
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
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, { 'lua', 'luadoc', 'luap' })
      end
    end,
  },
}
