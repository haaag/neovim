-- lsp.servers.pylsp
return {
  "neovim/nvim-lspconfig", -- https://github.com/neovim/nvim-lspconfig
  opts = {
    servers = {
      pylsp = {
        autostart = true,
        settings = {
          pylsp = {
            plugins = {
              -- disabled
              pylint = { enabled = false, executable = "pylint" },
              autopep8 = { enabled = false },
              pyflakes = { enabled = false },
              pycodestyle = { enabled = false },
              flake8 = { enabled = false },
              yapf = { enabled = false },
              mccabe = { enabled = false },
              ruff = { enabled = false },
              -- enabled
              pylsp_mypy = { enabled = true, dmypy = true, report_progress = true },
              black = { enabled = true },
              rope_autoimport = { enabled = true },
              jedi_completion = { enabled = true, fuzzy = true, include_params = true },
              jedi_hover = { enabled = true },
              jedi_references = { enabled = true },
              jedi_signature_help = { enabled = true },
              jedi_symbols = { enabled = true, all_scopes = true },
            },
          },
        },
      },
    },
  },
}
