-- lsp.config

return {
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

  { -- https://github.com/neovim/nvim-lspconfig
    'neovim/nvim-lspconfig',
    -- event = 'InsertEnter',
    cmd = { 'LspStart' },
    enabled = true,
    dependencies = { -- https://github.com/williamboman/mason-lspconfig.nvim
      'williamboman/mason-lspconfig.nvim',
    },
    opts = {
      inlay_hints = { enabled = true },
      document_highlight = { enabled = true },
      servers = {
        jsonls = { autostart = false },
        taplo = {},
        yamlls = {},
        docker_compose_language_service = {
          autostart = true,
        },
      },
      setup = {},
    },
    config = function(_, opts)
      -- diagnostics
      Core.lsp.diagnostic.set_keymaps()
      Core.lsp.diagnostic.set_handlers()
      vim.diagnostic.config(Core.lsp.diagnostic.defaults)

      Core.lsp.check_logfile_size()
      Core.lsp.on_attach(function(_, bufnr)
        Core.lsp.keymaps(bufnr)
      end)

      local servers = opts.servers
      local capabilities = Core.lsp.capabilities()

      require('mason-lspconfig').setup({ ensure_installed = vim.tbl_keys(servers), automatic_installation = false })
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

  { -- https://github.com/williamboman/mason.nvim
    'williamboman/mason.nvim',
    cmd = 'Mason',
    build = ':MasonUpdate',
    enabled = true,
    opts_extend = { 'ensure_installed' },
    opts = {
      ui = {
        icons = {
          package_installed = '●',
          package_pending = '➜',
          package_uninstalled = '○',
        },
      },
      ensure_installed = {
        'checkmake',
        'prettier',
      },
    },
    ---@param opts MasonSettings | {ensure_installed: string[]}
    config = function(_, opts)
      require('mason').setup(opts)
      local mr = require('mason-registry')
      mr.refresh(function()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end)
    end,
  },
}
