-- treesitter.lua

return { -- https://github.com/nvim-treesitter/nvim-treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    version = false,
    enabled = true,
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    init = function(_)
      require('nvim-treesitter.query_predicates')
    end,
    build = ':TSUpdate',
    cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
    keys = {
      { '<c-space>', desc = 'Increment selection', mode = 'x' },
      { '<bs>', desc = 'Schrink selection', mode = 'x' },
    },
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
      -- 'windwp/nvim-ts-autotag',
    },
    opts_extend = { 'ensure_installed' },
    ---@type TSConfig
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = { 'scratchpad' },
      },
      indent = { enable = true },
      context = { enabled = true, mode = 'cursor', max_lines = 3 },
      ensure_installed = {
        'asm',
        'c',
        'cmake',
        'cpp',
        'css',
        'html',
        'printf',
        'query',
        'rasi',
        'regex',
        'rust',
        'sql',
        'toml',
        'vim',
        'vimdoc',
        'yaml',
        'xresources',
        'zathurarc',
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          scope_incremental = false,
          node_decremental = '<bs>',
        },
      },
      textobjects = {
        enable = true,
        swap = { enable = false },
        move = {
          enable = true,
          goto_next_start = {
            [']f'] = '@function.outer',
            [']c'] = '@class.outer',
            [']a'] = '@parameter.inner',
          },
          goto_next_end = {
            [']F'] = '@function.outer',
            [']C'] = '@class.outer',
            [']A'] = '@parameter.inner',
          },
          goto_previous_start = {
            ['[f'] = '@function.outer',
            ['[c'] = '@class.outer',
            ['[a'] = '@parameter.inner',
          },
          goto_previous_end = {
            ['[F'] = '@function.outer',
            ['[C'] = '@class.outer',
            ['[A'] = '@parameter.inner',
          },
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
      if type(opts.ensure_installed) == 'table' then
        opts.ensure_installed = Core.dedup(opts.ensure_installed)
      end
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
}
