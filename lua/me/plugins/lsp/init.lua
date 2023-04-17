-- lsp-config

return {
  {
    "neovim/nvim-lspconfig", -- https://github.com/neovim/nvim-lspconfig
    event = "BufReadPre",
    enabled = true,
    dependencies = {
      -- { "folke/neodev.nvim", config = true },
      -- "hrsh7th/cmp-nvim-lsp", -- https://github.com/hrsh7th/cmp-nvim-lsp
      "mason.nvim", -- https://github.com/williamboman/mason.nvim
      "williamboman/mason-lspconfig.nvim", -- https://github.com/williamboman/mason-lspconfig.nvim
      "lukas-reineke/lsp-format.nvim", -- https://github.com/lukas-reineke/lsp-format.nvim
    },
    ---@class PluginLspOpts
    opts = {
      servers = {
        marksman = {},
        pyright = {
          autostart = true,
          disableOrganizeImports = true,
          handlers = { ["textDocument/publishDiagnostics"] = function() end },
          on_attach = function(client, _)
            client.server_capabilities.codeActionProvider = false
          end,
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                typeCheckingMode = "off",
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
        pylsp = {
          autostart = false,
          settings = {
            pylsp = {
              plugins = {
                -- disabled
                pylint = { enabled = false, executable = "pylint" },
                autopep8 = { enabled = false },
                pyflakes = { enabled = false },
                pycodestyle = { enabled = false },
                flake8 = { enabled = false },
                yapf = { enabled = false },
                mccabe = { enabled = false },
                -- enabled
                ruff = { enabled = false },
                pylsp_mypy = { enabled = true, dmypy = true, report_progress = true },
                black = { enabled = true },
                rope_autoimport = { enabled = true },
                jedi_completion = {
                  enabled = true,
                  fuzzy = true,
                  include_params = true,
                },
                jedi_hover = { enabled = true },
                jedi_references = { enabled = true },
                jedi_signature_help = { enabled = true },
                jedi_symbols = {
                  enabled = true,
                  all_scopes = true,
                },
              },
            },
          },
        },
        --[[ gopls = {
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
        }, ]]
        bashls = {},
        jsonls = {},
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
        "luacheck",
        "stylua",
        -- python
        -- "black",
        -- "isort",
        -- "mypy",
        -- "pylint",
        -- "pyproject-flake8",
        "ruff",
        -- web
        -- "prettier",
        -- "eslint_d",
        "deno",
        -- shell
        "shellcheck",
        "shfmt",
        -- markdown
        "markdownlint",
        "write-good",
        "cbfmt",
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
