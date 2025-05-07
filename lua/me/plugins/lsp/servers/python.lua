-- lsp.servers.basedpyright
return {
  { -- https://github.com/nvim-treesitter/nvim-treesitter
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, { 'ninja', 'python', 'rst', 'toml', 'requirements' })
      end
    end,
  },

  { -- https://github.com/williamboman/mason.nvim
    'williamboman/mason.nvim',
    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, { 'debugpy', 'mypy' })
      end
    end,
  },

  { -- https://github.com/mfussenegger/nvim-dap
    'mfussenegger/nvim-dap',
    optional = true,
    enabled = Core.env.debug,
    dependencies = { -- https://github.com/mfussenegger/nvim-dap-python
      { 'mfussenegger/nvim-dap-python', ft = 'python', enabled = Core.env.debug },
    },
    -- stylua: ignore
    keys = {
      { '<leader>dp', '', desc = '+python'},
      { '<leader>dpm', function() require('dap-python').test_method() end, desc = 'python: test method' },
      { '<leader>dpc', function() require('dap-python').test_class() end, desc = 'python: test class' },
      { '<leader>dpd', function() require('dap-python').debug_selection() end, desc = 'python: debug selection' },
    },
    opts = function()
      local pypath = Core.env.xdg_data_home() .. '/nvim/mason/packages/debugpy/venv/bin/python'
      require('dap').configurations.python = {
        {
          type = 'python',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          -- justMyCode = false,
          pythonPath = function()
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
              return cwd .. '/venv/bin/python'
            elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
              return cwd .. '/.venv/bin/python'
            else
              return vim.fn.exepath('python3') or vim.fn.exepath('python')
            end
          end,
        },
      }
      require('dap-python').setup(pypath)
    end,
  },

  { -- https://github.com/nvim-neotest/neotest
    'nvim-neotest/neotest',
    enabled = Core.env.testing,
    dependencies = { -- https://github.com/nvim-neotest/neotest-python
      { 'nvim-neotest/neotest-python', enabled = Core.env.testing },
    },
    opts = {
      adapters = {
        ['neotest-python'] = {},
      },
    },
  },
}
