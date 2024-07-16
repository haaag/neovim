-- local enabled = Core.boolme(os.getenv('NVIM_DEBUG'))
local enabled = true

return {
  { -- https://github.com/mfussenegger/nvim-dap
    'mfussenegger/nvim-dap',
    lazy = true,
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      'mfussenegger/nvim-dap-python',
      'theHamsta/nvim-dap-virtual-text',
    },
    enabled = enabled,
    -- stylua: ignore
    init = function()
      local map = vim.keymap.set
      -- stylua: ignore
      map("n", "<leader>db", "<CMD>lua require'dap'.toggle_breakpoint()<CR>", { desc = "debug toggle breakpoint" })
      map("n", "<leader>dB", "<CMD>lua require'dap'.set_breakpoint(vim.fn.input('[DAP] Condition > '))<CR>", { desc = "debug conditional breakpoint" })
      map("n", "<leader>dr", "<CMD>lua require'dap'.run_to_cursor()<CR>", { desc = "debug run to cursor" })
      map("n", "<leader>dP", "<CMD>lua require'dap'.repl.open()<CR>", { desc = "debug repl open" })
      map("n", "<leader>dc", "<CMD>lua require'dap'.continue()<CR>", { desc = "debug continue" })
      map("n", "<leader>dt", "<CMD>lua require('dapui').toggle()<CR>", { desc = "debug ui toggle" })
      map("n", "<leader>dE", "<CMD>lua require('dapui').eval(vim.fn.input '[DAP] Expression > ')<CR>", { desc = "debug add expression" })
      -- step
      map("n", "<leader>dsb", "<CMD>lua require'dap'.step_back()<CR>", { desc = "debug step back" })
      map("n", "<leader>dsi", "<CMD>lua require'dap'.step_into()<CR>", { desc = "debug step into" })
      map("n", "<leader>dso", "<CMD>lua require'dap'.step_over()<CR>", { desc = "debug step over" })
      map("n", "<leader>dsO", "<CMD>lua require'dap'.step_out()<CR>", { desc = "debug step out" })
      map("n", "<F5>", "<CMD>lua require'dap'.step_back()<CR>", { desc = "step back" })
      map("n", "<F6>", "<CMD>lua require'dap'.step_into()<CR>", { desc = "step into" })
      map("n", "<F7>", "<CMD>lua require'dap'.step_over()<CR>", { desc = "step over" })
      map("n", "<F8>", "<CMD>lua require'dap'.step_out()<CR>", { desc = "step out" })
      -- python
      map("n", "<leader>dpm", "<CMD>lua require('dap-python').test_method()<CR>", { desc = "test method" })
      map("n", "<leader>dpc", "<CMD>lua require('dap-python').test_class()<CR>", { desc = "test class" })
      map("v", "<leader>dpd", "<CMD>lua require('dap-python').debug_selection()<CR>", { desc = "debug selection" })
    end,
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')
      local icons = Core.icons.dap()
      require('nvim-dap-virtual-text').setup({})

      -- dap signs
      local signs = {
        DapBreakpoint = {
          text = icons.signs.breakpoint,
          texthl = 'DiagnosticSignError',
        },
        DapBreakpointCondition = {
          text = icons.signs.breakpoint_condition,
          texthl = 'DiagnosticSignHint',
        },
        DapBreakpointRejected = {
          text = icons.signs.breakpoint_rejected,
          texthl = 'DiagnosticSignWarn',
        },
        DapLogPoint = {
          text = icons.signs.log_point,
          texthl = 'DiagnosticSignError',
        },
        DapStopped = {
          text = icons.signs.stopped,
          texthl = 'DiagnosticSignInfo',
          linehl = 'CursorLine',
        },
      }

      for sign, options in pairs(signs) do
        vim.fn.sign_define(sign, options)
      end

      --
      -- dap-ui
      local dapui_config = {
        icons = icons.ui,
        mappings = {
          -- Use a table to apply multiple mappings
          expand = { '<CR>', '<2-LeftMouse>' },
          open = 'o',
          remove = 'd',
          edit = 'e',
          repl = 'r',
          toggle = 't',
        },
        -- Use this to override mappings for specific elements
        element_mappings = {},
        expand_lines = true,
        layouts = {
          {
            elements = {
              'scopes',
              'breakpoints',
              'stacks',
              'watches',
            },
            size = 80,
            position = 'left',
          },
          {
            elements = {
              'repl',
              'console',
            },
            size = 10,
            position = 'bottom',
          },
        },
        controls = {
          enabled = false,
          -- Display controls in this element
          element = 'repl',
          icons = icons.constrols,
        },
        floating = {
          max_height = 0.9,
          max_width = 0.5, -- Floats will be treated as percentage of your screen.
          border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
          mappings = {
            close = { 'q', '<Esc>' },
          },
        },
        windows = { indent = 1 },
        render = {
          max_type_length = nil, -- Can be integer or nil.
          max_value_lines = 100, -- Can be integer or nil.
        },
      }

      dapui.setup(dapui_config)

      -- dapui.setup()
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
      --
      -- dap-python
      dap.configurations.python = {
        {
          type = 'python',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
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
      local path = '~/.local/share/nvim/mason/packages/debugpy/venv/bin/python'
      require('dap-python').setup(path)
      --
      -- dap-go
      dap.adapters.delve = {
        type = 'server',
        port = '${port}',
        executable = {
          command = 'dlv',
          args = { 'dap', '-l', '127.0.0.1:${port}' },
        },
      }
      dap.configurations.go = {
        {
          type = 'delve',
          name = 'Debug',
          request = 'launch',
          program = '${file}',
        },
        {
          type = 'delve',
          name = 'Debug test', -- configuration for debugging test files
          request = 'launch',
          mode = 'test',
          program = '${file}',
        },
        -- works with go.mod packages and sub packages
        {
          type = 'delve',
          name = 'Debug test (go.mod)',
          request = 'launch',
          mode = 'test',
          program = './${relativeFileDirname}',
        },
      }
    end,
  },
}
