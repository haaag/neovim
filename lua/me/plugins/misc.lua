return {
  { -- https://github.com/baskerville/vim-sxhkdrc
    'baskerville/vim-sxhkdrc',
    ft = { 'sxhkdrc' },
    enabled = true,
  },

  { -- https://github.com/toppair/peek.nvim
    'toppair/peek.nvim',
    cmd = { 'PeekOpen', 'PeekClose' },
    build = 'deno task --quiet build:fast',
    ft = { 'markdown' },
    config = function()
      require('peek').setup({
        -- theme = "dark", -- 'dark'
        theme = 'light', -- 'dark'
      })
      vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
      vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
    end,
    keys = {
      { '<leader>mp', '<CMD>PeekOpen<CR>', desc = 'Peek Open' },
      { '<leader>mP', '<CMD>PeekClose<CR>', desc = 'Peek Close' },
    },
    enabled = true,
  },
}
