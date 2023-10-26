-- lsp.servers.go
return {
  'neovim/nvim-lspconfig', -- https://github.com/neovim/nvim-lspconfig
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
