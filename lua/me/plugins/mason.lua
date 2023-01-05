-- mason.lua
-- https://github.com/williamboman/mason.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim
-- https://github.com/neovim/nvim-lspconfig

local M = {
  "williamboman/mason.nvim",
  event = "BufReadPre",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
    "lukas-reineke/lsp-format.nvim",
  },
}

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

  local on_attach = require("me.lsp").on_attach
  local capabilities = require("me.lsp").capabilities()

  for _, lsp in ipairs(servers) do
    require("lspconfig")[lsp].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end
end

M.load_servers_config = function()
  require("me.lsp.diagnostic")
  require("me.lsp.servers.sumneko")
  require("me.lsp.servers.tsserver")
  require("me.lsp.efm")
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
  "prettier",
  "eslint_d",
  "deno",
  -- shell
  "shellcheck",
  "shfmt",
}

M.check_tools = function()
  local registry_present, mason_registry = pcall(require, "mason-registry")
  if registry_present then
    for _, tool in ipairs(M.tools) do
      local p = mason_registry.get_package(tool)
      if not p:is_installed() then
        p:install()
      end
    end
  end
end

function M.config()
  require("mason").setup()
  M.check_tools()
  M.install_servers()
  M.load_servers_config()
end

return M
