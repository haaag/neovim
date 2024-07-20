-- lsp.servers.pyright
return {
  { -- https://github.com/neovim/nvim-lspconfig
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        basedpyright = { -- https://github.com/DetachHead/basedpyright
          autostart = true,
          disableOrganizeImports = true,
          handlers = { ['textDocument/publishDiagnostics'] = function() end },
          on_attach = function(client, _)
            client.server_capabilities.semanticTokensProvider = nil
          end,
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                typeCheckingMode = 'off',
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
        ruff_lsp = {
          enabled = true,
          autostart = true,
          settings = {
            ruff_lsp = {
              fix = false,
            },
          },
          -- stylua: ignore
          on_attach = function(client, bufnr)
            local map = vim.keymap.set
            map('n', '<leader>lo', Core.lsp.action['source.organizeImports'], { buffer = bufnr, desc = 'organize imports' })
            map('n', '<leader>lF', Core.lsp.action['source.fixAll'], { buffer = bufnr, desc = 'fix all' })
            client.server_capabilities.hoverProvider = false
          end,
        },
      },
    },
  },
  { -- https://github.com/nvim-treesitter/nvim-treesitter
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, { 'ninja', 'python', 'rst', 'toml' })
      end
    end,
  },
  { -- https://github.com/williamboman/mason.nvim
    'williamboman/mason.nvim',
    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, { 'debugpy' })
      end
    end,
  },
}
