-- lsp.servers.pyright
return {
  'neovim/nvim-lspconfig', -- https://github.com/neovim/nvim-lspconfig
  -- enabled = false,
  opts = {
    servers = {
      pyright = {
        autostart = false,
        disableOrganizeImports = true,
        handlers = { ['textDocument/publishDiagnostics'] = function() end },
        on_attach = function(client, _)
          client.server_capabilities.codeActionProvider = false
        end,
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              typeCheckingMode = 'off',
              useLibraryCodeForTypes = true,
            },
          },
        },
      },
    },
  },
}
