return {

  --[[ { -- https://github.com/echasnovski/mini.surround
    'echasnovski/mini.surround',
    keys = function(plugin, keys)
      -- Populate the keys based on the user's options
      local opts = require('lazy.core.plugin').values(plugin, 'opts', false)
      local mappings = {
        { opts.mappings.add, desc = 'add surrounding', mode = { 'n', 'v' } },
        { opts.mappings.delete, desc = 'delete surrounding' },
        { opts.mappings.find, desc = 'find right surrounding' },
        { opts.mappings.find_left, desc = 'find left surrounding' },
        { opts.mappings.highlight, desc = 'highlight surrounding' },
        { opts.mappings.replace, desc = 'replace surrounding' },
        { opts.mappings.update_n_lines, desc = 'update `MiniSurround.config.n_lines`' },
      }
      return vim.list_extend(mappings, keys)
    end,
    version = false,
    opts = {
      mappings = {
        add = 'gza', -- Add surrounding in Normal and Visual modes
        delete = 'gzd', -- Delete surrounding
        find = 'gzf', -- Find surrounding (to the right)
        find_left = 'gzF', -- Find surrounding (to the left)
        highlight = 'gzh', -- Highlight surrounding
        replace = 'gzr', -- Replace surrounding
        update_n_lines = 'gzn', -- Update `n_lines`
      },
    },
    config = function(_, opts)
      require('mini.surround').setup(opts)
    end,
    enabled = true,
  }, ]]

  { -- https://github.com/numToStr/Comment.nvim
    'numToStr/Comment.nvim',
    config = true,
    enabled = true,
  },

  { -- https://github.com/stevearc/aerial.nvim
    'stevearc/aerial.nvim',
    opts = { show_guides = true },
    keys = {
      { '<F2>', '<CMD>AerialToggle<CR>', desc = 'aerial toggle' },
      { '[f', '<cmd>AerialPrev<CR>', desc = 'aerial prev' },
      { ']f', '<cmd>AerialNext<CR>', desc = 'aerial next' },
    },
  },

  --[[ { -- https://github.com/Exafunction/codeium.vim
    'Exafunction/codeium.vim',
    cmd = { 'CodeiumEnable', 'Codeium' },
    enabled = true,
    config = function()
      vim.g.codeium_enabled = false
      -- vim.g.codeium_render = false
      vim.keymap.set('i', '<C-g>', function()
        return vim.fn['codeium#Accept']()
      end, { expr = true })
      vim.keymap.set('i', '<M-;>', function()
        return vim.fn['codeium#CycleCompletions'](1)
      end, { expr = true })
      vim.keymap.set('i', '<M-,>', function()
        return vim.fn['codeium#CycleCompletions'](-1)
      end, { expr = true })
    end,
  }, ]]

  { -- https://github.com/folke/lazydev.nvim
    'folke/lazydev.nvim',
    ft = 'lua', -- only load on lua files
    cmd = 'LazyDev',
    enabled = true,
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
        { path = 'Core', words = { 'Core' } },
      },
    },
  },
}
