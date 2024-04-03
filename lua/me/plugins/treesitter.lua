-- treesitter.lua
-- https://github.com/nvim-treesitter/nvim-treesitter
-- Highlight, edit, and navigate code

return {
  {
    'nvim-treesitter/nvim-treesitter',
    version = false,
    enabled = true,
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    cmd = { 'TSUpdateSync' },
    keys = {
      { '<c-space>', desc = 'Increment selection' },
      { '<bs>', desc = 'Schrink selection', mode = 'x' },
    },
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
      -- 'windwp/nvim-ts-autotag',
    },
    opts = {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
        -- disable = { 'python', 'css' },
      },
      autotag = {
        enable = false,
      },
      context = {
        enabled = false,
        max_lines = 10,
        multiline_threshold = 10,
      },
      ensure_installed = {
        'bash',
        'c',
        'c_sharp',
        'cmake',
        'cpp',
        'css',
        'org',
        'html',
        'markdown',
        'markdown_inline',
        'rasi',
        'rust',
        'sql',
        'vim',
        'vimdoc',
        'yaml',
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          scope_incremental = '<nop>',
          node_decremental = '<bs>',
        },
      },
      textobjects = {
        enable = true,
        swap = {
          enable = false,
        },
        move = {
          enable = false,
        },
        select = {
          enable = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',

            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',

            ['al'] = '@loop.outer',
            ['il'] = '@loop.inner',

            ['ad'] = '@conditional.outer',
            ['id'] = '@conditional.inner',

            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
          },
        },
      },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
}
