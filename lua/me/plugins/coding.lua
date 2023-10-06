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

  { -- https://github.com/ms-jpq/coq_nvim
    'ms-jpq/coq_nvim',
    branch = 'coq',
    build = ':COQdeps',
    lazy = false,
    init = function()
      local icons = require('me.config.icons').icons
      vim.g.coq_settings = {
        auto_start = 'shut-up',
        keymap = {
          pre_select = false,
          manual_complete_insertion_only = false,
          jump_to_mark = '',
        },
        display = {
          icons = {
            mode = 'long',
            mappings = icons.lsp.kinds,
          },
        },
        completion = {
          always = true,
          skip_after = {
            '{',
            '}',
            '[',
            ']',
          },
        },
        clients = {
          tags = { enabled = true, short_name = 'tags' },
          tmux = { enabled = true, short_name = 'tmux' },
          buffers = { same_filetype = true, short_name = 'buf' },
          paths = { preview_lines = 3, short_name = 'path' },
          lsp = { enabled = true, short_name = 'lsp' },
          snippets = { enabled = true, short_name = 'snip' },
          tree_sitter = {
            always_on_top = false,
            enabled = false,
            short_name = 'ts',
          },
        },
      }
    end,
    dependencies = { -- https://github.com/ms-jpq/coq.thirdparty
      { 'ms-jpq/coq.artifacts', branch = 'artifacts' },
      { 'ms-jpq/coq.thirdparty', branch = '3p' },
    },
    config = function()
      require('coq_3p')({
        { src = 'nvimlua', short_name = 'api', conf_only = true }, -- Lua
        { src = 'bc', short_name = 'math', precision = 6 }, -- Calculator
        { src = 'codeium', short_name = 'cod' },
        -- { src = "vim_dadbod_completion", short_name = "DB" },
        { src = 'cow', trigger = '!cow' },
        {
          src = 'figlet',
          trigger = '!big',
          short_name = 'BIG',
          fonts = {
            '/usr/share/figlet/standard.flf',
          },
        },
        -- { src = "dap" },
        {
          src = 'repl',
          sh = 'zsh',
          shell = { p = 'perl', n = 'node' },
          max_lines = 99,
          deadline = 500,
          unsafe = { 'rm', 'poweroff', 'mv' },
        },
      })
    end,
    enabled = true,
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
