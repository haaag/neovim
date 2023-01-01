-- sumneko.lua
local lsp_present, lspconfig = pcall(require, "lspconfig")

if lsp_present then
  local on_attach = require("me.lsp").on_attach
  local capabilities = require("me.lsp").capabilities()

  local runtime_path = vim.split(package.path, ";")
  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")

  lspconfig.sumneko_lua.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          path = runtime_path,
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
        telemetry = { enable = false },
      },
    },
  })
end
