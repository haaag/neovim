return {

  { -- https://github.com/echasnovski/mini.surround
    'echasnovski/mini.surround',
    keys = function(plugin, keys)
      -- Populate the keys based on the user's options
      local opts = require('lazy.core.plugin').values(plugin, 'opts', false)
      local mappings = {
        { opts.mappings.add, desc = 'Add surrounding', mode = { 'n', 'v' } },
        { opts.mappings.delete, desc = 'Delete surrounding' },
        { opts.mappings.find, desc = 'Find right surrounding' },
        { opts.mappings.find_left, desc = 'Find left surrounding' },
        { opts.mappings.highlight, desc = 'Highlight surrounding' },
        { opts.mappings.replace, desc = 'Replace surrounding' },
        { opts.mappings.update_n_lines, desc = 'Update `MiniSurround.config.n_lines`' },
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
  },

  { -- https://github.com/L3MON4D3/LuaSnip
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    event = 'InsertEnter',
    dependencies = {
      'rafamadriz/friendly-snippets',
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
      end,
    },
    main = 'me.config.plugins.luasnip',
    config = true,
  },

  { -- https://github.com/hrsh7th/nvim-cmp/releases
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'davidsierradz/cmp-conventionalcommits',
      'lukas-reineke/cmp-under-comparator',
      'saadparwaiz1/cmp_luasnip',
    },
    main = 'me.config.plugins.completion',
    config = true,
  },

  { -- https://github.com/numToStr/Comment.nvim
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    config = true,
    enabled = true,
  },

  { -- https://github.com/stevearc/aerial.nvim
    'stevearc/aerial.nvim',
    opts = { show_guides = true },
    keys = {
      { '<F2>', '<CMD>AerialToggle<CR>', desc = 'Aerial toggle' },
      { '<leader><F2>', '<CMD>AerialNavToggle<CR>', desc = 'Aerial toggle' },
      { '[f', '<cmd>AerialPrev<CR>', desc = 'Aerial Prev' },
      { ']f', '<cmd>AerialNext<CR>', desc = 'Aerial Next' },
    },
  },

  { -- https://github.com/Vimjas/vim-python-pep8-indent
    'Vimjas/vim-python-pep8-indent',
    ft = { 'py', 'python' },
    enabled = true,
  },

  { -- https://github.com/Exafunction/codeium.vim
    'Exafunction/codeium.vim',
    event = 'InsertEnter',
    ft = { 'python', 'javascript', 'sh', 'typescript', 'typescriptreact', 'lua' },
    config = function()
      vim.g.codeium_enabled = true
      -- vim.g.codeium_render = false
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set('i', '<C-g>', function()
        return vim.fn['codeium#Accept']()
      end, { expr = true })
      vim.keymap.set('i', '<M-;>', function()
        return vim.fn['codeium#CycleCompletions'](1)
      end, { expr = true })
      vim.keymap.set('i', '<M-,>', function()
        return vim.fn['codeium#CycleCompletions'](-1)
      end, { expr = true })
      -- vim.keymap.set('i', '<C-x>', function()
      --   return vim.fn['codeium#Clear']()
      -- end, { expr = true })
    end,
    enabled = true,
  },
}
