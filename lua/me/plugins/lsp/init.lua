-- lsp-config

return {
  { -- https://github.com/neovim/nvim-lspconfig
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    enabled = true,
    dependencies = {
      "mason.nvim", -- https://github.com/williamboman/mason.nvim
      "williamboman/mason-lspconfig.nvim", -- https://github.com/williamboman/mason-lspconfig.nvim
      "lukas-reineke/lsp-format.nvim", -- https://github.com/lukas-reineke/lsp-format.nvim
      { "raimon49/requirements.txt.vim", event = "BufReadPre requirements*.txt" },
    },
    ---@class PluginLspOpts
    opts = {
      servers = {
        marksman = {},
        bashls = {},
        jsonls = { autostart = false },
        ruff_lsp = {
          autostart = true,
          settings = {
            ruff_lsp = {
              fix = false,
            },
          },
        },
      },
      setup = {},
    },
    ---@param opts PluginLspOpts
    config = function(_, opts)
      -- diagnostics
      local diagnostic = require("me.plugins.lsp.diagnostic")
      diagnostic.setup()
      vim.diagnostic.config(diagnostic.config())

      require("me.plugins.lsp.utils").on_attach(function(client, bufnr)
        require("me.plugins.lsp.keys").on_attach(bufnr)
        client.server_capabilities.semanticTokensProvider = nil
        if client.name ~= "clangd" then
          require("lsp-format").on_attach(client)
        end

        if client.name == "ruff_lsp" then
          client.server_capabilities.hover = false
        end
      end)

      local servers = opts.servers
      local capabilities = require("me.plugins.lsp.utils").capabilities()

      require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(servers) })
      require("mason-lspconfig").setup_handlers({
        function(server)
          local coq = require("coq")
          local server_opts = servers[server] or {}
          server_opts.capabilities = capabilities
          if opts.setup[server] then
            if opts.setup[server](server, server_opts) then
              return
            end
          elseif opts.setup["*"] then
            if opts.setup["*"](server, server_opts) then
              return
            end
          end
          require("lspconfig")[server].setup(coq.lsp_ensure_capabilities(server_opts))
        end,
      })
    end,
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    enabled = true,
    opts = {
      ensure_installed = {
        -- lua
        -- "luacheck",
        "stylua",
        -- python
        -- "black",
        -- "mypy",
        -- "sourcery",
        "ruff",
        "debugpy",
        -- web
        "prettier",
        "eslint_d",
        -- "deno",
        -- shell
        "shellcheck",
        "shfmt",
        -- markdown
        "markdownlint",
        "write-good",
        "cbfmt",
        "alex",
        -- go
        -- "goimports",
        -- "staticcheck",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end,
  },
}
