-- lsp-config

return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig", -- https://github.com/neovim/nvim-lspconfig
    event = "BufReadPre",
    enabled = true,
    dependencies = {
      { "folke/neodev.nvim", config = true },
      "mason.nvim", -- https://github.com/williamboman/mason.nvim
      "williamboman/mason-lspconfig.nvim", -- https://github.com/williamboman/mason-lspconfig.nvim
      "hrsh7th/cmp-nvim-lsp", -- https://github.com/hrsh7th/cmp-nvim-lsp
      "lukas-reineke/lsp-format.nvim", -- https://github.com/lukas-reineke/lsp-format.nvim
    },
    ---@class PluginLspOpts
    opts = {
      servers = {
        clangd = {},
        marksman = {},
        pyright = {
          autostart = true,
        },
        gopls = {
          settings = {
            gopls = {
              experimentalPostfixCompletions = true,
              analyses = {
                unusedparams = true,
                shadow = true,
              },
              staticcheck = true,
            },
          },
          init_options = {
            usePlaceholders = true,
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              format = {
                enable = false,
              },
              telemetry = {
                enable = false,
              },
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
              diagnostics = {
                enable = true,
                globals = {
                  "vim",
                },
              },
            },
          },
        },
        bashls = {},
        jsonls = {},
        ruff_lsp = {},
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
      end)

      local servers = opts.servers
      local capabilities = require("me.plugins.lsp.utils").capabilities()

      require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(servers) })
      require("mason-lspconfig").setup_handlers({
        function(server)
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
          require("lspconfig")[server].setup(server_opts)
        end,
      })
    end,
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ensure_installed = {
        -- lua
        "luacheck",
        "stylua",
        -- python
        "black",
        "isort",
        "mypy",
        "pylint",
        "pyproject-flake8",
        "ruff",
        -- web
        "prettier",
        "eslint_d",
        "deno",
        -- shell
        "shellcheck",
        "shfmt",
        -- markdown
        "markdownlint",
        "write-good",
        "cbfmt",
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
