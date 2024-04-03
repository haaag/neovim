return {
  { -- https://github.com/tpope/vim-fugitive
    'tpope/vim-fugitive',
    cmd = { 'Git', 'G', 'Gw' },
    keys = function()
      local Utils = require('me.config.utils')
      return {
        { '<leader>go', '<CMD>tab Git<CR>', desc = 'git fugitive tab' },
        { '<leader>gw', '<CMD>Gw<CR>', desc = 'git write' },
        { '<leader>gp', Utils.git_push, desc = 'git push' },
        { '<leader>gf', Utils.find_files, desc = 'git files' },
        { '<leader>ga', '<CMD>Git commit --amend --no-edit<CR>', desc = 'git amend' },
        { '<leader>gc', '<CMD>Gvdiffsplit!<CR>', desc = 'git merge conflict' },
      }
    end,
    enabled = true,
  },

  { -- https://github.com/lewis6991/gitsigns.nvim
    'lewis6991/gitsigns.nvim',
    -- event = 'BufReadPost',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '-' },
        changedelete = { text = '~_' },
        untracked = { text = '┆' },
      },
      -- signcolumn = false,
    },
    keys = {
      -- misc
      { '<leader>gb', '<CMD>Gitsigns toggle_current_line_blame<CR>', desc = 'git toggle blame' },
      -- telescope
      { '<leader>gts', '<CMD>Telescope git_status<CR>', desc = 'git telescope status' },
      { '<leader>gtx', '<CMD>Telescope git_stash<CR>', desc = 'git telescope stash' },
      { '<leader>gtB', '<CMD>Telescope git_branches<CR>', desc = 'git telescope branches' },
      { '<leader>gtb', '<CMD>Telescope git_bcommits<CR>', desc = 'git telescope buffer Commits' },
      -- hunks
      { ']h', '<CMD>Gitsigns next_hunk<CR>', desc = 'git next hunk' },
      { '[h', '<CMD>Gitsigns prev_hunk<CR>', desc = 'git prev hunk' },
      { ']p', '<CMD>Gitsigns preview_hunk<CR>', desc = 'git preview hunk' },
      { '<leader>ghs', '<CMD>Gitsigns stage_hunk<CR>', desc = 'git stage hunk', mode = { 'n', 'v' } },
      { '<leader>ghr', '<CMD>Gitsigns reset_hunk<CR>', desc = 'git reset hunk', mode = { 'n', 'v' } },
      { '<leader>ghS', '<CMD>Gitsigns stage_buffer<CR>', desc = 'git stage buffer' },
      { '<leader>ghu', '<CMD>Gitsigns undo_stage_hunk<CR>', desc = 'git undo stage hunk' },
      { '<leader>ghR', '<CMD>Gitsigns reset_buffer<CR>', desc = 'git reset buffer' },
      { '<leader>ghp', '<CMD>Gitsigns preview_hunk<CR>', desc = 'git preview hunk' },
      { '<leader>ghd', '<CMD>Gitsigns diffthis<CR>', desc = 'git diff this hunk' },
      { '<leader>ghD', '<CMD>lua require"gitsigns".diffthis("~")<CR>', desc = 'git diff this ~' },
      { 'ih', ':<C-U>Gitsigns select_hunk<CR>', desc = 'git select hunk', mode = { 'o', 'x' } },
      -- highlights
      { '<leader>ghl', '<CMD>Gitsigns toggle_linehl<CR>', desc = 'git highlight line' },
      { '<leader>ghn', '<CMD>Gitsigns toggle_numhl<CR>', desc = 'git highlight numbers' },
    },
    enabled = true,
  },

  { -- https://github.com/sindrets/diffview.nvim
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles' },
    config = true,
    keys = {
      { '<leader>gdo', '<CMD>DiffviewOpen<CR>', desc = 'diffview open' },
      { '<leader>gdc', '<CMD>DiffviewClose<CR>', desc = 'diffview close' },
      { '<leader>gdf', '<CMD>DiffviewToggleFiles<CR>', desc = 'diffview files' },
      { '<leader>gdh', '<CMD>DiffviewFileHistory %<CR>', desc = 'diffview file history' },
    },
    enabled = true,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, {
          'diff',
          'git_rebase',
          'gitattributes',
          'gitcommit',
          'gitignore',
        })
      end
    end,
  },
}
