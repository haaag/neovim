return {
  { -- TODO: Break this config.
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
      "theHamsta/nvim-dap-virtual-text",
    },
    enabled = false,
    init = function()
      -- stylua: ignore
      local map = vim.keymap.set
      map(
        "n",
        "<leader>db",
        "<CMD>lua require'dap'.toggle_breakpoint()<CR>",
        { desc = "[D]ebugging Toggle [B]reakpoint" }
      )
      map("n", "<leader>dr", "<cmd>lua require'dap'.run_to_cursor()<cr>", { desc = "[D]ebugging [R]un to cursor" })
      map("n", "<leader>dP", "<cmd>lua require'dap'.repl.open()<cr>", { desc = "[D]ebugging Repl open" })
      map("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { desc = "[D]ebugging [C]ontinue" })
      map("n", "<leader>dt", "<CMD>lua require('dapui').toggle()<CR>", { desc = "[D]ebugging UI [T]oggle" })
      -- step
      map("n", "<leader>dsb", "<cmd>lua require'dap'.step_back()<cr>", { desc = "[S]tep [B]ack" })
      map("n", "<leader>dsi", "<cmd>lua require'dap'.step_into()<cr>", { desc = "[S]tep [I]nto" })
      map("n", "<leader>dso", "<cmd>lua require'dap'.step_over()<cr>", { desc = "[S]tep [o]ver" })
      map("n", "<leader>dsO", "<cmd>lua require'dap'.step_out()<cr>", { desc = "[S]tep [O]ut" })
      -- python
      map("n", "<leader>dpm", "<cmd>lua require('dap-python').test_method()<CR>", { desc = "Test Method" })
      map("n", "<leader>dpc", "<cmd>lua require('dap-python').test_class()<CR>", { desc = "Test Class" })
      map("v", "<leader>dpd", "<cmd>lua require('dap-python').debug_selection()<CR>", { desc = "Debug Selection" })
    end,
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      require("nvim-dap-virtual-text").setup()
      --
      -- signs
      --
      local signs = {
        DapBreakpoint = { text = "", texthl = "DiagnosticSignError" },
        DapLogPoint = { text = "◉", texthl = "DiagnosticSignError" },
        DapStopped = { text = "⇥", texthl = "DiagnosticSignInfo", linehl = "CursorLine" },
      }
      for sign, options in pairs(signs) do
        vim.fn.sign_define(sign, options)
      end
      --
      -- dap-ui
      --
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
      --
      -- dap-python
      --
      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          pythonPath = function()
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
              return cwd .. "/venv/bin/python"
            elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
              return cwd .. "/.venv/bin/python"
            else
              return vim.fn.exepath("python3") or vim.fn.exepath("python")
            end
          end,
        },
      }
      require("dap-python").setup("~/.local/debugpy/bin/python")
    end,
  },
}
