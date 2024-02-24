-- lsp-config

return {
  { -- https://github.com/neovim/nvim-lspconfig
    'neovim/nvim-lspconfig',
    event = { 'BufReadPost' },
    enabled = true,
    dependencies = {
      'mason.nvim', -- https://github.com/williamboman/mason.nvim
      'williamboman/mason-lspconfig.nvim', -- https://github.com/williamboman/mason-lspconfig.nvim
      { -- https://github.com/j-hui/fidget.nvim
        'j-hui/fidget.nvim',
        event = 'LspAttach',
        opts = {
          notification = {
            window = { winblend = 0 },
          },
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
        taplo = {},
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
      vim.diagnostic.config(diagnostic.defaults())

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
          require('lspconfig')[server].setup(server_opts)
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
        'stylua',
        'ruff',
        'shfmt',
        'prettier',
        'debugpy',
        'eslint_d',
        'shellcheck',
        'markdownlint',
        'write-good',
        'goimports',
        'alex',
        'staticcheck',
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
}
