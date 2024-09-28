return {

  { -- https://github.com/echasnovski/mini.bufremove
    'echasnovski/mini.bufremove',
    -- stylua: ignore
    keys = {
      { '<leader>bd', '', desc = '+buffers' },
      { "<leader>bdc", function() require("mini.bufremove").delete(0, false) end, desc = "buffer delete" },
      { "<leader>bdF", function() require("mini.bufremove").delete(0, true) end, desc = "buffer delete (force)" },
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
    keys = {
      -- stylua: ignore start
      { ']t', function() require('todo-comments').jump_next() end, desc = 'next todo comment' },
      { '[t', function() require('todo-comments').jump_prev() end, desc = 'previous todo comment' },
      -- stylua: ignore stop
      { '<leader>mt', '<CMD>TodoFzfLua<CR>', desc = 'todo telescope' },
      { '<leader>sT', '<CMD>TodoFzfLua<CR>', desc = 'search todo' },
      { '<leader>mT', function()
        if Core.has('trouble.nvim') then
          vim.cmd('<CMD>TodoTrouble keywords=TODO,FIX,FIXME,WIP,NOTE,HACK<CR>')
        else
          Core.warnme('trouble.nvim not installed\n')
        end
      end, desc = 'TODO/FIX/FIXME (trouble)' },
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
    enabled = Core.is_executable('deno'),
  },

  { -- https://github.com/mbbill/undotree
    'mbbill/undotree',
    keys = {
      { '<leader>gu', '<CMD>UndotreeToggle<CR>', desc = 'undotree' },
    },
  },

  { -- fzf-projects
    'haaag/projects.nvim',
    dependencies = { 'ibhagwan/fzf-lua' },
    cmd = { 'Projects' },
    opts = {
      prompt = 'Projects>> ',
      color = true,
    },
    keys = {
      { '<leader>sp', '<CMD>Projects<CR>', desc = 'search projects' },
    },
    enabled = true,
  },
}
