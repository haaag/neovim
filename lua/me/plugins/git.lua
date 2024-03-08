return {
  { -- https://github.com/tpope/vim-fugitive
    'tpope/vim-fugitive',
    cmd = { 'Git', 'G', 'Gw' },
    keys = function()
      local Utils = require('me.config.utils')
      return {
        { '<leader>go', '<CMD>tab Git<CR>', desc = 'Git Fugitive' },
        { '<leader>gl', '<CMD>tab Git log --oneline<CR>', desc = 'Git Log' },
        { '<leader>gw', '<CMD>Gw<CR>', desc = 'Git Write' },
        { '<leader>gp', Utils.git_push, desc = 'Git Push' },
        { '<leader>gf', Utils.find_files, desc = 'Git Files' },
        { '<leader>ga', '<CMD>Git commit --amend --no-edit<CR>', desc = 'Git amend' },
      }
    end,
    enabled = true,
  },

  { -- https://github.com/lewis6991/gitsigns.nvim
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPost',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '-' },
        changedelete = { text = '~_' },
      },
    },
    keys = {
      -- misc
      { '<leader>gb', '<CMD>Gitsigns toggle_current_line_blame<CR>', desc = 'Git Toggle Blame' },
      { '<leader>ghD', '<CMD>lua require"gitsigns".diffthis("~")<CR>', desc = 'Git Diff This ~' },
      -- telescope
      { '<leader>gts', '<CMD>Telescope git_status<CR>', desc = 'Git Telescope Status' },
      { '<leader>gtx', '<CMD>Telescope git_stash<CR>', desc = 'Git Telescope stash' },
      { '<leader>gtB', '<CMD>Telescope git_branches<CR>', desc = 'Git Telescope Branches' },
      { '<leader>gtb', '<CMD>Telescope git_bcommits<CR>', desc = 'Git Telescope Buffer Commits' },
      -- hunks
      { ']h', '<CMD>Gitsigns next_hunk<CR>', desc = 'Git Next Hunk' },
      { '[h', '<CMD>Gitsigns prev_hunk<CR>', desc = 'Git Prev Hunk' },
      { ']p', '<CMD>Gitsigns preview_hunk<CR>', desc = ' Git Preview Hunk' },
      { '<leader>ghs', '<CMD>Gitsigns stage_hunk<CR>', desc = 'Git Stage Hunk', mode = { 'n', 'v' } },
      { '<leader>ghr', '<CMD>Gitsigns reset_hunk<CR>', desc = 'Git Reset Hunk', mode = { 'n', 'v' } },
      { '<leader>ghS', '<CMD>Gitsigns stage_buffer<CR>', desc = 'Git Stage Buffer' },
      { '<leader>ghu', '<CMD>Gitsigns undo_stage_hunk<CR>', desc = 'Git Undo Stage Hunk' },
      { '<leader>ghR', '<CMD>Gitsigns reset_buffer<CR>', desc = 'Git Reset Buffer' },
      { '<leader>ghp', '<CMD>Gitsigns preview_hunk<CR>', desc = 'Git Preview Hunk' },
      { '<leader>ghd', '<CMD>Gitsigns diffthis<CR>', desc = 'Git Diff This Hunk' },
      { 'ih', ':<C-U>Gitsigns select_hunk<CR>', desc = 'Git Select Hunk', mode = { 'o', 'x' } },
    },
    enabled = true,
  },

  { -- https://github.com/sindrets/diffview.nvim
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles' },
    config = true,
    keys = {
      { '<leader>gdo', '<CMD>DiffviewOpen<CR>', desc = 'Diffview Open' },
      { '<leader>gdc', '<CMD>DiffviewClose<CR>', desc = 'Diffview Close' },
      { '<leader>gdf', '<CMD>DiffviewToggleFiles<CR>', desc = 'Diffview Files' },
      { '<leader>gdh', '<CMD>DiffviewFileHistory %<CR>', desc = 'Diffview file History' },
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
