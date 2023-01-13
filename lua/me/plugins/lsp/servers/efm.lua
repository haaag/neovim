-- efm
-- https://github.com/mattn/efm-langserver

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Python
local black = require("me.plugins.lsp.servers.efm-tools.python").black()
local flake8 = require("me.plugins.lsp.servers.efm-tools.python").flake8()
local isort = require("me.plugins.lsp.servers.efm-tools.python").isort()
local mypy = require("me.plugins.lsp.servers.efm-tools.python").mypy()
local pylint = require("me.plugins.lsp.servers.efm-tools.python").pylint()
local ruff = require("me.plugins.lsp.servers.efm-tools.python").ruff()

-- Lua
local luacheck = require("me.plugins.lsp.servers.efm-tools.lua").luacheck()
local stylua = require("me.plugins.lsp.servers.efm-tools.lua").stylua()

-- Shell
local shellcheck = require("me.plugins.lsp.servers.efm-tools.shell").shellcheck()
local shfmt = require("me.plugins.lsp.servers.efm-tools.shell").shfmt()

-- Web
local eslint = require("me.plugins.lsp.servers.efm-tools.web").eslint()
local prettier = require("me.plugins.lsp.servers.efm-tools.web").prettier()

-- Others
local misspell = require("me.plugins.lsp.servers.efm-tools.misspell")
local markdownlint = require("me.plugins.lsp.servers.efm-tools.markdown").markdownlint()
local write_good = require("me.plugins.lsp.servers.efm-tools.markdown").write_good()

local languages = {
  ["="] = { misspell },
  lua = { stylua, luacheck },
  python = { black, isort, flake8, mypy, pylint, ruff },
  css = { prettier },
  html = { prettier },
  javascript = { prettier, eslint },
  javascriptreact = { prettier, eslint },
  json = { prettier },
  markdown = { markdownlint, write_good },
  scss = { prettier },
  sh = { shellcheck, shfmt },
  typescript = { prettier, eslint },
  typescriptreact = { prettier, eslint },
  yaml = { prettier },
}

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      efm = {
        capabilities = capabilities,
        cmd = { tostring(os.getenv("HOME")) .. "/apps/github/efm-langserver/efm-langserver" },
        init_options = { documentFormatting = true },
        root_dir = vim.loop.cwd,
        filetypes = vim.tbl_keys(languages),
        settings = {
          rootMarkers = { ".git/" },
          lintDebounce = 100,
          languages = languages,
        },
      },
    },
    setup = {
      efm = function(_, opts)
        require("lspconfig").efm.setup(opts)
        return true
      end,
    },
  },
}
