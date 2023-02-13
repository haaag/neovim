-- lsp.utils.lua

local M = {}

---@param on_attach fun(client, buffer)
function M.on_attach(on_attach)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      on_attach(client, buffer)
    end,
  })
end

function M.capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local present_cmp, cmp_nvim = pcall(require, "cmp_nvim_lsp")
  if present_cmp then
    return cmp_nvim.default_capabilities(capabilities)
  end
  return capabilities
end

return M
