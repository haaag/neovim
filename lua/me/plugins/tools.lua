return {

  { -- https://github.com/echasnovski/mini.bufremove
    'echasnovski/mini.bufremove',
    -- stylua: ignore
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Buffer [d]elete" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Buffer [D]elete (Force)" },
    },
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
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Search Todo" },
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
