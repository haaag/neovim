return {

  { -- https://github.com/echasnovski/mini.bufremove
    'echasnovski/mini.bufremove',
    -- stylua: ignore
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "[B]uffer [d]elete" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "[B]uffer [D]elete (Force)" },
    },
    enabled = true,
  },

  { -- https://github.com/akinsho/toggleterm.nvim
    'akinsho/toggleterm.nvim',
    event = 'VeryLazy',
    opts = {
      size = 18,
      open_mapping = [[<c-\>]],
      hide_numbers = true, -- hide the number column in toggleterm buffers
      shade_terminals = false,
      direction = 'float', -- | 'horizontal' | 'window' | 'float',
      close_on_exit = true, -- close the terminal window when the process exits
      float_opts = {
        border = 'curved',
        winblend = 0,
      },
    },
    config = function(_, opts)
      require('toggleterm').setup(opts)
    end,
    enabled = true,
  },

  { -- https://github.com/folke/todo-comments.nvim
    'folke/todo-comments.nvim',
    cmd = { 'TodoTrouble', 'TodoTelescope' },
    event = 'BufReadPost',
    opts = {
      keywords = {
        WIP = { icon = ' ', color = 'warning' },
      },
    },
    config = function(_, opts)
      require('todo-comments').setup(opts)
    end,
    -- stylua: ignore
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
      { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME,WIP,NOTE,HACK<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "[S]earch [T]odo" },
    },
    enabled = true,
  },

  { -- https://github.com/folke/trouble.nvim
    'folke/trouble.nvim',
    cmd = { 'TroubleToggle', 'Trouble' },
    opts = { use_diagnostic_signs = true },
    keys = {
      -- stylua: ignore
      { "<leader>xx", "<CMD>TroubleToggle document_diagnostics<CR>", desc = "Document Diagnostics (Trouble)" },
      { '<leader>xX', '<CMD>TroubleToggle workspace_diagnostics<CR>', desc = 'Workspace Diagnostics (Trouble)' },
    },
    enabled = true,
  },
}
