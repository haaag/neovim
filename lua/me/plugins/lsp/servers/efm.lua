-- efm
-- https://github.com/mattn/efm-langserver

local fmt = require("me.plugins.lsp.servers.formatting")
local linters = require("me.plugins.lsp.servers.linters")
local capabilities = require("me.plugins.lsp.utils").capabilities()

local languages = {
  ["="] = { linters.misspell },
  css = { fmt.prettier },
  go = { linters.staticcheck, fmt.goimports },
  html = { fmt.prettier },
  javascript = { fmt.prettier, linters.eslint },
  javascriptreact = { fmt.prettier, linters.eslint },
  json = { fmt.prettier },
  -- lua = {
  --   fmt.stylua, --[[ linters.luachec ]]
  -- },
  markdown = { linters.markdownlint, linters.write_good, linters.alex },
  python = { linters.mypy, fmt.black, linters.ruff },
  -- python = { linters.mypy, fmt.black, linters.ruff, linters.pylint },
  scss = { fmt.prettier },
  -- sh = { linters.shellcheck, fmt.shfmt },
  typescript = { fmt.prettier, linters.eslint },
  typescriptreact = { fmt.prettier, linters.eslint },
  yaml = { fmt.prettier },
}

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      efm = {
        capabilities = capabilities,
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
