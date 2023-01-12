-- lsp-config

return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig", -- https://github.com/neovim/nvim-lspconfig
    event = "BufReadPre",
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
        pyright = {},
        -- pylsp = {},
        tsserver = {},
        sumneko_lua = {},
        bashls = {},
        jsonls = {},
        ruff_lsp = {},
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        -- tsserver = function(_, opts)
        --   require("typescript").setup({ server = opts })
        --   return true
        -- end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
    ---@param opts PluginLspOpts
    config = function(_, opts)
      require("me.plugins.lsp.utils").on_attach(function(client, bufnr)
        require("me.plugins.lsp.keys").on_attach(bufnr)
        if client.name ~= "clangd" then
          require("lsp-format").on_attach(client)
        end
      end)

      -- diagnostics
      require("me.plugins.lsp.diagnostic")
      local servers = opts.servers
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

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
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    enabled = false,
    opts = function()
      local null_ls = require("null-ls")
      local b = null_ls.builtins
      return {
        sources = {
          b.formatting.stylua,
          b.formatting.shfmt,
          b.formatting.shellharden,
          b.formatting.isort,
          b.formatting.black,
          b.formatting.eslint_d,
          -- b.formatting.ruff,
          -- b.formatting.prettier,

          b.diagnostics.shellcheck,
          b.diagnostics.ruff,
          b.diagnostics.mypy,
          b.diagnostics.pyproject_flake8,
          b.diagnostics.write_good,
          b.diagnostics.markdownlint,
          b.diagnostics.gitlint,

          b.hover.dictionary,
        },
      }
    end,
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ensure_installed = {
        -- lua
        -- "luacheck",
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
