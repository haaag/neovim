-- mason config

local M = {}

M.install_servers = function()
  local servers = {
    "clangd",
    "rust_analyzer",
    "pyright",
    "tsserver",
    "sumneko_lua",
    "bashls",
    "jsonls",
    -- "pylsp",
  }

  -- Ensure the servers above are installed
  require("mason-lspconfig").setup({
    ensure_installed = servers,
  })

  local on_attach = require("me.lsp.config").on_attach
  local capabilities = require("me.lsp.config").capabilities()

  for _, lsp in ipairs(servers) do
    require("lspconfig")[lsp].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end
end

M.tools = {
  -- lua
  "luacheck",
  "stylua",
  -- python
  "black",
  "isort",
  "mypy",
  "pylint",
  "pyproject-flake8",
  -- web
  "prettierd",
  "eslint_d",
  -- shell
  "shellcheck",
  "shfmt",
}

-- Ensure the tools above are installed
M.check_tools = function()
  local registry_present, mason_registry = pcall(require, "mason-registry")
  if registry_present then
    for _, tool in ipairs(M.tools) do
      local p = mason_registry.get_package(tool)
      if not p:is_installed() then p:install() end
    end
  end
end

M.setup = function()
  require("mason").setup()
  M.check_tools()
  M.install_servers()
end

return M
