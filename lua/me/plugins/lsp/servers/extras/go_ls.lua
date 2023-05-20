-- lsp.servers.go
return {
  "neovim/nvim-lspconfig", -- https://github.com/neovim/nvim-lspconfig
  -- enabled = false,
  opts = {
    servers = {
      gopls = {
        autostart = false,
        settings = {
          gopls = {
            experimentalPostfixCompletions = true,
            analyses = {
              unusedparams = true,
              shadow = true,
            },
            staticcheck = true,
          },
        },
        init_options = {
          usePlaceholders = true,
        },
      },
    },
  },
}
