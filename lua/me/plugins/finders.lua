-- finders.lua

return {
  { -- https://github.com/ibhagwan/fzf-lua
    'ibhagwan/fzf-lua',
    lazy = true,
    enabled = true,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = { 'FzfLua' },
    config = function()
      local defaults = {
        ['ctrl-d'] = 'half-page-down',
        ['ctrl-u'] = 'half-page-up',
        ['ctrl-/'] = 'toggle-preview',
      }
      require('fzf-lua').setup({
        Core.getenv('TMUX_FZF_PROFILE', 'default'), -- env var setted in `tmux.conf`
        defaults = {
          winopts = {
            preview = { hidden = 'hidden' },
          },
        },
        keymap = {
          builtin = defaults,
          fzf = defaults,
        },
      })
    end,
    -- stylua: ignore start
    keys = {
      { '<leader>s', '', desc = '+search', mode = { 'n', 'v' } },
      -- search
      { '<C-p>', '<CMD>FzfLua files<CR>', desc = 'search files' },
      -- { '<C-p>', function() Core.find_files() end, desc = 'search files' },
      { '<leader>?', '<CMD>FzfLua oldfiles<CR>', desc = '[?] find recently opened files' },
      { '<leader>:', '<CMD>FzfLua command_history<CR>', desc = 'search command History' },
      { '<leader>/', '<CMD>FzfLua grep_curbuf<CR>', desc = 'fuzzily search in current buf' },
      { '<leader>sf', '<CMD>FzfLua files<CR>', desc = 'search all files' },
      { '<leader>sr', '<CMD>FzfLua resume<CR>', desc = 'search resume' },
      { '<leader>sh', '<CMD>FzfLua helptags<CR>', desc = 'search help' },
      { '<leader>sg', '<CMD>FzfLua live_grep<CR>', desc = 'search by grep' },
      { '<leader>sw', '<CMD>FzfLua grep_cword<CR>', desc = 'search current word', mode = 'n' },
      { '<leader>sw', '<CMD>FzfLua grep_visual<CR>', desc = 'search current word', mode = 'v' },
      { '<leader><space>', function()
        require('fzf-lua').buffers({
          winopts = {
            relative = 'cursor',
            row = 1.00,
            col = 0,
            height = 0.4,
            width = 0.5,
            preview = { hidden = 'hidden' },
          },
        })
      end, desc = 'search buffers' },
      -- git search
      { '<leader>gs', '', desc = '+finders' },
      { '<leader>gss', '<CMD>FzfLua git_status<CR>', desc = 'git status' },
      { '<leader>gsx', '<CMD>FzfLua git_stash<CR>', desc = 'git stash' },
      { '<leader>gsB', '<CMD>FzfLua git_branches<CR>', desc = 'git branches' },
      { '<leader>gsb', '<CMD>FzfLua git_bcommits<CR>', desc = 'git buffer Commits' },
      -- misc
      -- stylua: ignore stop
      {
        mode = { 'i' },
        '<C-x><C-f>',
        function()
          require('fzf-lua').complete_file({
            cmd = 'rg --files',
            winopts = {
              relative = 'cursor',
              row = 1.00,
              col = 0,
              height = 0.3,
              width = 0.4,
              preview = { hidden = 'hidden' },
            },
          })
        end,
        desc = 'fuzzy complete file',
      },
    },
  },

  { -- https://github.com/haaag/projects.nvim
    -- 'haaag/projects.nvim',
    dir = '~/dev/git/lualang/projects.nvim',
    dependencies = {
      'ibhagwan/fzf-lua',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      previewer = {
        enabled = true,
      },
      color = true,
      icons = {
        enabled = true,
        default = '',
        warning = '',
        color = '#fd4d5d',
      },
    },
    keys = {
      { '<leader>sp', '<CMD>FzfLuaProjects<CR>', desc = 'search projects' },
    },
    enabled = true,
  },

  { -- https://github.com/haaag/projects.nvim
    -- 'haaag/projects.nvim',
    dir = '~/dev/git/lualang/projects.nvim',
    dependencies = {
      'ibhagwan/fzf-lua',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      prompt = 'Projects>> ',
      color = true,
      icons = {
        enabled = true,
        default = '',
        warning = '',
        color = '#fd4d5d',
      },
    },
    keys = {
      { '<leader>sp', '<CMD>FzfLuaProjects<CR>', desc = 'search projects' },
    },
    enabled = true,
  },

  { -- https://github.com/stevearc/oil.nvim
    'stevearc/oil.nvim',
    opts = {
      delete_to_trash = true,
    },
    cmd = { 'Oil' },
    keys = {
      { '-', '<CMD>Oil<CR>', desc = 'open parent directory' },
    },
    lazy = false,
    enabled = true,
  },

  { -- https://github.com/ggandor/flit.nvim
    'ggandor/flit.nvim',
    keys = function()
      local ret = {}
      for _, key in ipairs({ 'f', 'F', 't', 'T' }) do
        ret[#ret + 1] = { key, mode = { 'n', 'x', 'o' }, desc = key }
      end
      return ret
    end,
    opts = { labeled_modes = 'nx' },
    enabled = true,
  },

  { -- https://github.com/ggandor/leap.nvim
    'ggandor/leap.nvim',
    keys = {
      { 's', mode = { 'n', 'x', 'o' }, desc = 'leap forward to' },
      { 'S', mode = { 'n', 'x', 'o' }, desc = 'leap backward to' },
      { 'gs', mode = { 'n', 'x', 'o' }, desc = 'leap from windows' },
    },
    config = function(_, opts)
      local leap = require('leap')
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ 'x', 'o' }, 'x')
      vim.keymap.del({ 'x', 'o' }, 'X')
    end,
    enabled = true,
  },
}
