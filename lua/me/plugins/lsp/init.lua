-- lsp-config

return {
  { -- https://github.com/neovim/nvim-lspconfig
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    enabled = true,
    dependencies = {
      'mason.nvim', -- https://github.com/williamboman/mason.nvim
      'williamboman/mason-lspconfig.nvim', -- https://github.com/williamboman/mason-lspconfig.nvim
      { -- https://github.com/j-hui/fidget.nvim
        'j-hui/fidget.nvim',
        event = 'VeryLazy',
        tag = 'legacy',
        opts = {
          text = { spinner = 'dots_pulse' }, -- dots_pulse, bouncing_bar
          align = { bottom = true },
          window = { relative = 'editor', blend = 0 }, -- border = "rounded",
        },
        enabled = true,
      },
    },
    ---@class PluginLspOpts
    opts = {
      servers = {
        bashls = {},
        clangd = { autostart = false },
        marksman = {},
        pyright = { autostart = false },
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
      local diagnostic = require('me.plugins.lsp.diagnostic')
      diagnostic.setup()
      vim.diagnostic.config(diagnostic.config())

      require('me.plugins.lsp.utils').on_attach(function(client, bufnr)
        require('me.plugins.lsp.keys').on_attach(bufnr)
        client.server_capabilities.semanticTokensProvider = nil

        if client.name == 'ruff_lsp' then
          client.server_capabilities.hover = false
        end
      end)

      local servers = opts.servers
      local capabilities = require('me.plugins.lsp.utils').capabilities()

      require('mason-lspconfig').setup({ ensure_installed = vim.tbl_keys(servers) })
      require('mason-lspconfig').setup_handlers({
        function(server)
          local coq = require('coq')
          local server_opts = servers[server] or {}
          server_opts.capabilities = capabilities
          if opts.setup[server] then
            if opts.setup[server](server, server_opts) then
              return
            end
          elseif opts.setup['*'] then
            if opts.setup['*'](server, server_opts) then
              return
            end
          end
          require('lspconfig')[server].setup(coq.lsp_ensure_capabilities(server_opts))
        end,
      })
    end,
  },

  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    enabled = true,
    opts = {
      ensure_installed = {
        -- lua
        -- "luacheck",
        'stylua',
        -- python
        'ruff',
        'debugpy',
        -- web
        'prettier',
        'eslint_d',
        -- shell
        'shellcheck',
        'shfmt',
        -- markdown
        'markdownlint',
        'write-good',
        'cbfmt',
        'alex',
        -- go
        -- "goimports",
        -- "staticcheck",
      },
    },
    config = function(_, opts)
      require('mason').setup(opts)
      local mr = require('mason-registry')
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end,
  },

  -- TODO: Replace tool (deprecated)
  { -- https://github.com/jose-elias-alvarez/null-ls.nvim
    'jose-elias-alvarez/null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'mason.nvim' },
    opts = function()
      local nls = require('null-ls')
      return {
        root_dir = require('null-ls.utils').root_pattern('.null-ls-root', '.neoconf.json', 'Makefile', '.git'),
        sources = {
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.prettier,
          -- markdown
          nls.builtins.diagnostics.markdownlint,
          nls.builtins.diagnostics.write_good,
          nls.builtins.diagnostics.alex,
          nls.builtins.diagnostics.codespell,
          -- python
          nls.builtins.diagnostics.mypy.with({ method = nls.methods.DIAGNOSTICS_ON_SAVE }),
          nls.builtins.formatting.black,
          -- nls.builtins.diagnostics.ruff,
          -- shell
          nls.builtins.formatting.shfmt,
          nls.builtins.code_actions.shellcheck,
        },
      }
    end,
    enabled = true,
  },
}
