-- lsp.servers.luad_ls
return {
  'neovim/nvim-lspconfig', -- https://github.com/neovim/nvim-lspconfig
  opts = {
    servers = {
      lua_ls = {
        autostart = true,
        settings = {
          Lua = {
            format = { enable = false },
            telemetry = { enable = false },
            workspace = { checkThirdParty = false },
            completion = { callSnippet = 'Replace' },
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
}
