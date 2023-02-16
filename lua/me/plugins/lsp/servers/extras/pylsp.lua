-- lsp.servers.pylsp
return {
  "neovim/nvim-lspconfig", -- https://github.com/neovim/nvim-lspconfig
  --[[ dependencies = {
      "mfussenegger/nvim-dap-python",
  }, ]]
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
              pylsp_mypy = { enabled = false, live_mode = false },
              black = { enabled = false },
              mccabe = { enabled = false },
              -- enabled
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
      },
    },
  },
  -- TODO: Difine the keybindings for dap-python
  --[[ keys = {
    {"<leader>dpm", "<cmd>lua require('dap-python').test_method()<CR>", "Test Method"  },
      { "<leader>dpc", "<cmd>lua require('dap-python').test_class()<CR>", "Test Class"  },
      { "<leader>dpd", "<cmd>lua require('dap-python').debug_selection()<CR>", "Debug Selection", mode = { "v" } },
  }, ]]
}
