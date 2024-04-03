return {

  { -- https://github.com/catppuccin/nvim
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    lazy = false,
    enabled = true,
    opts = function()
      return {
        flavour = 'mocha',
        transparent_background = true,
        show_end_of_buffer = true,
        styles = {
          comments = { 'italic' },
          conditionals = { 'italic' },
          loops = {},
          functions = {},
          keywords = {},
          strings = { 'italic' },
          variables = {},
          numbers = {},
          booleans = { 'italic' },
          properties = {},
          types = {},
          operators = {},
        },
        integrations = {
          cmp = false,
          gitsigns = true,
          nvimtree = false,
          treesitter = true,
          treesitter_context = false,
          neotest = true,
          lsp_trouble = true,
          which_key = false,
          aerial = true,
          fidget = true,
          leap = true,
          mason = true,
          dap = true,
          dap_ui = true,

          indent_blankline = { enabled = true, colored_indent_levels = true },
          mini = { enabled = true, indentscope_color = '' },
        },
      }
    end,
    config = function(_, opts)
      require('catppuccin').setup(opts)
      vim.cmd.colorscheme('catppuccin')
    end,
  },

  --[[ { -- https://github.com/folke/tokyonight.nvim
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    enabled = false,
    opts = function()
      return {
        style = 'storm',
        sidebars = {
          'qf',
          'vista_kind',
          'vista',
          'terminal',
          'toggleterm',
          'spectre_panel',
          'neogitstatus',
          'help',
          'startuptime',
          'outline',
        },
        transparent = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = { bold = false },
          variables = {},
          sidebars = 'normal', -- "dark", "transparent" or "normal"
          floats = 'normal', -- "dark", "transparent" or "normal"
        },
      }
    end,
    config = function(_, opts)
      local tokyonight = require('tokyonight')
      tokyonight.setup(opts)
      tokyonight.load()
    end,
  }, ]]

  { -- https://github.com/ellisonleao/gruvbox.nvim
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    enabled = false,
    config = function()
      require('gruvbox').setup({
        terminal_colors = true,
        undercurl = true,
        underline = true,
        bold = false,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = true,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = 'hard', -- can be "hard", "soft" or empty string
        dim_inactive = false,
        transparent_mode = true,
        palette_overrides = {},
        overrides = {
          SignColumn = { bg = 'NONE' },
        },
      })
      vim.o.background = 'dark'
      vim.cmd('colorscheme gruvbox')
    end,
  },
}
