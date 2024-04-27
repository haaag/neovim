-- finders.lua

return {
  { -- https://github.com/nvim-telescope/telescope.nvim
    'nvim-telescope/telescope.nvim',
    -- event = 'VeryLazy',
    version = '0.1.x',
    cmd = { 'Telescope' },
    enabled = true,
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      -- { -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
      --   'nvim-telescope/telescope-fzf-native.nvim',
      --   build = 'make',
      -- },
      { 'nvim-telescope/telescope-project.nvim' }, -- https://github.com/nvim-telescope/telescope-project.nvim
    },
    -- luacheck: ignore
    keys = {
      -- search
      { '<C-p>', '<CMD>Telescope find_files theme=get_ivy<CR>', desc = 'search files' },
      { '<leader>?', '<CMD>Telescope oldfiles<CR>', desc = '[?] find recently opened files' },
      {
        '<leader>sp',
        "<CMD>lua require'telescope'.extensions.project.project{ display_type = 'full' }<CR>",
        desc = 'search project',
      },
      { '<leader>sr', '<CMD>Telescope resume<CR>', desc = 'search resume' },
      { '<leader>sw', '<CMD>Telescope grep_string<CR>', desc = 'search current [W]ord' },
      { '<leader>sg', '<CMD>Telescope live_grep<CR>', desc = 'search by grep' },
      { '<leader>sd', '<CMD>Telescope diagnostics<CR>', desc = 'search diagnostics' },
      { '<leader>sh', '<CMD>Telescope help_tags<CR>', desc = 'search help' },
      { '<leader>su', '<CMD>Telescope undo<CR>', desc = 'search undo' },
      { '<leader>sk', '<CMD>Telescope keymaps<CR>', desc = 'search keymaps' },
      { '<leader>:', '<CMD>Telescope command_history<CR>', desc = 'search command History' },
      {
        '<leader><space>',
        "<CMD>lua require('telescope.builtin').buffers(require('telescope.themes').get_cursor({ previewer = false }))<CR>",
        desc = 'search buffers',
      },
      {
        '<leader>/',
        "<CMD>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_ivy({previewer = false}))<CR>",
        desc = '[/] fuzzily search in current buffer]',
      },
    },
  },

  { -- https://github.com/stevearc/oil.nvim
    'stevearc/oil.nvim',
    opts = {},
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
