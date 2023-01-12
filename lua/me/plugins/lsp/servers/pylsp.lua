-- pylsp
--[[ local lsp_present, lspconfig = pcall(require, "lspconfig")

if lsp_present then
  local on_attach = require("me.lsp").on_attach
  local capabilities = require("me.lsp").capabilities()
  lspconfig.pylsp.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    single_file_support = true,
    settings = {
      pylsp = {
        plugins = {
          -- pylint = { enabled = false, executable = "pylint" },
          -- pyflakes = { enabled = false },
          -- pycodestyle = { enabled = false },
          -- flake8 = { enabled = false },
          -- pylsp_mypy = { enabled = false, live_mode = false },
          -- black = { enabled = false },
          rope_autoimport = { enabled = true },
          jedi_completion = {
            enabled = true,
            fuzzy = true,
            include_params = true,
          },
          jedi_hover = { enabled = true },
          jedi_references = { enabled = true },
          jedi_signature_help = { enabled = true },
          jedi_symbols = {
            enabled = true,
            all_scopes = true,
          },
        },
      },
    },
  })
end ]]
