-- [[ efm ]] 

local HOME = tostring(os.getenv("HOME"))
local on_attach = require("me.lsp.config").on_attach
local capabilities = require("me.lsp.config").capabilities()

-- Python
local black = require("me.lsp.efm.black")
local flake8 = require("me.lsp.efm.flake8")
local isort = require("me.lsp.efm.isort")
local mypy = require("me.lsp.efm.mypy")

-- Lua
local luacheck = require("me.lsp.efm.luacheck")
local stylua = require("me.lsp.efm.stylua")

-- Shell
local shellcheck = require("me.lsp.efm.shellcheck")
local shfmt = require("me.lsp.efm.shfmt")

-- Others
local eslint = require("me.lsp.efm.eslint")
local misspell = require("me.lsp.efm.misspell")
local prettier = require("me.lsp.efm.prettier")

local languages = {
  ["="] = { misspell },
  lua = { stylua, luacheck },
  python = { black, isort, flake8, mypy },
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
require('lspconfig').efm.setup({
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
