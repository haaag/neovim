-- lsp-config

local M = {}

M.on_attach = function(client, bufnr)
  -- lsp keymaps
  require("me.lsp.keys").on_attach(bufnr)

  -- lsp auto-format
  if client.name ~= "clangd" then
    require("lsp-format").on_attach(client)
  end
end

M.capabilities = function()
  -- nvim-cmp supports additional completion capabilities
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
  return capabilities
end

return M
