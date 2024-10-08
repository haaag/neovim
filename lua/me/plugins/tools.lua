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
    -- dependencies: webkit2gtk (webview)
    'toppair/peek.nvim',
    build = 'deno task --quiet build:fast',
    opts = {
      theme = 'light',
      app = 'webview',
    },
    -- stylua: ignore
    keys = {
      { '<leader>mp', function() require('peek').open() end, desc = 'peek open' },
      { '<leader>mP', function () require('peek').close() end, desc = 'peek close' },
    },
    enabled = Core.is_executable('deno'),
  },

  { -- https://github.com/mbbill/undotree
    'mbbill/undotree',
    keys = {
      { '<leader>gu', '<CMD>UndotreeToggle<CR>', desc = 'undotree' },
    },
  },

  { -- projects with fzf
    dir = '~/dev/git/lualang/projects.nvim',
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
