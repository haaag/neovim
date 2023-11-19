-- lsp.servers.go
-- https://github.com/neovim/nvim-lspconfig
return {
  'neovim/nvim-lspconfig',
  opts = {
    servers = {
      gopls = {
        autostart = true,
        settings = {
          gopls = {
            experimentalPostfixCompletions = true,
            analyses = {
              unusedparams = true,
              shadow = true,
            },
            staticcheck = true,
            gofumpt = true,
            hints = { enable = true },
          },
        },
        init_options = {
          usePlaceholders = true,
        },
      },
    },
  },
}
