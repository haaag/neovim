return {

  { -- https://github.com/echasnovski/mini.bufremove
    'echasnovski/mini.bufremove',
    -- stylua: ignore
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "buffer delete" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "buffer delete (force)" },
    },
    enabled = true,
  },

  { -- https://github.com/folke/todo-comments.nvim
    'folke/todo-comments.nvim',
    cmd = { 'TodoTrouble', 'TodoTelescope' },
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
      { "]t", function() require("todo-comments").jump_next() end, desc = "next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "previous todo comment" },
      { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "todo (trouble)" },
      { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME,WIP,NOTE,HACK<cr>", desc = "TODO/FIX/FIXME (trouble)" },
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "search todo" },
    },
    enabled = true,
  },

  { -- https://github.com/folke/trouble.nvim
    'folke/trouble.nvim',
    cmd = { 'TroubleToggle', 'Trouble' },
    opts = { use_diagnostic_signs = true },
    keys = {
      -- stylua: ignore
      { "<leader>xx", "<CMD>TroubleToggle document_diagnostics<CR>", desc = "document diagnostics (trouble)" },
      { '<leader>xX', '<CMD>TroubleToggle workspace_diagnostics<CR>', desc = 'workspace diagnostics (trouble)' },
    },
    enabled = true,
  },

  { -- https://github.com/toppair/peek.nvim
    'toppair/peek.nvim',
    build = 'deno task --quiet build:fast',
    cmd = { 'PeekClose', 'PeekOpen' },
    config = function()
      require('peek').setup({
        theme = 'light',
      })
      vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
      vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
    end,
    keys = {
      { '<leader>mp', '<CMD>PeekOpen<CR>', desc = 'peek open' },
      { '<leader>mP', '<CMD>PeekClose<CR>', desc = 'peek close' },
    },
    enabled = true,
  },
}
