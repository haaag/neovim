-- [[ efm ]]

local HOME = tostring(os.getenv("HOME"))
local on_attach = require("me.lsp.config").on_attach
local capabilities = require("me.lsp.config").capabilities()
local lspconfig = require("lspconfig")

-- Python
local black = require("me.lsp.efm.python").black()
local flake8 = require("me.lsp.efm.python").flake8()
local isort = require("me.lsp.efm.python").isort()
local mypy = require("me.lsp.efm.python").mypy()
local pylint = require("me.lsp.efm.python").pylint()

-- Lua
-- local luacheck = require("me.lsp.efm.lua").luacheck()
local stylua = require("me.lsp.efm.lua").stylua()

-- Shell
local shellcheck = require("me.lsp.efm.shell").shellcheck()
local shfmt = require("me.lsp.efm.shell").shfmt()

-- web
local eslint = require("me.lsp.efm.web").eslint()
local prettier = require("me.lsp.efm.web").prettier()

-- Others
local misspell = require("me.lsp.efm.misspell")

local languages = {
  ["="] = { misspell },
  lua = { stylua },
  -- lua = { stylua, luacheck },
  python = { black, isort, flake8, mypy, pylint },
  css = { prettier },
  html = { prettier },
  javascript = { prettier, eslint },
  javascriptreact = { prettier, eslint },
  json = { prettier },
  markdown = { prettier },
  scss = { prettier },
  sh = { shellcheck, shfmt },
  typescript = { prettier, eslint },
  typescriptreact = { prettier, eslint },
  yaml = { prettier },
}

-- efm
lspconfig.efm.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { HOME .. "/apps/github/efm-langserver/efm-langserver" },
  init_options = { documentFormatting = true },
  root_dir = vim.loop.cwd,
  filetypes = vim.tbl_keys(languages),
  settings = {
    rootMarkers = { ".git/" },
    lintDebounce = 100,
    languages = languages,
  },
})
