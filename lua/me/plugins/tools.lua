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
    cmd = { 'TodoTrouble', 'TodoTelescope', 'TodoQuickFix', 'TodoLocList' },
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
      { "<leader>mt", "<CMD>TodoTelescope<CR>", desc = "todo telescope" },
      { "<leader>mT", "<CMD>TodoTrouble keywords=TODO,FIX,FIXME,WIP,NOTE,HACK<CR>", desc = "TODO/FIX/FIXME (trouble)" },
      { "<leader>st", "<CMD>TodoTelescope<CR>", desc = "search todo" },
    },
    enabled = true,
  },

  { -- https://github.com/folke/trouble.nvim
    'folke/trouble.nvim',
    cmd = { 'TroubleToggle', 'Trouble' },
    opts = { use_diagnostic_signs = true },
    keys = {
      -- stylua: ignore
      { "<leader>mx", "<CMD>TroubleToggle document_diagnostics<CR>", desc = "document diagnostics (trouble)" },
      { '<leader>mX', '<CMD>TroubleToggle workspace_diagnostics<CR>', desc = 'workspace diagnostics (trouble)' },
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

  { -- https://github.com/szw/vim-maximizer
    'szw/vim-maximizer',
    cmd = { 'MaximizerToggle' },
    config = function()
      vim.g.maximizer_set_default_mapping = 1
      vim.g.maximizer_set_mapping_with_bang = 1
    end,
    keys = {
      { '<C-w>O', '<CMD>MaximizerToggle!<CR>', { desc = 'toggle maximizer' } },
    },
    enabled = true,
  },

  { -- https://github.com/mbbill/undotree
    'mbbill/undotree',
    keys = {
      { '<F4>', '<CMD>UndotreeToggle<CR>', desc = 'undotree' },
    },
  },
}
