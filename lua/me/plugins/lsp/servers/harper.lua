-- lsp.servers.harper

return {
  { -- https://github.com/neovim/nvim-lspconfig
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        harper_ls = {
          filetypes = { 'markdown' },
          autostart = true,
          settings = {
            ['harper-ls'] = {
              isolateEnglish = true,
            },
          },
        },
      },
    },
  },
}
