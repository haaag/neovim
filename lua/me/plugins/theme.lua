return {

  --[[ { -- https://github.com/catppuccin/nvim
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
          loops = { 'italic' },
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
          cmp = true,
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
  }, ]]

  { -- https://github.com/sainnhe/gruvbox-material
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    enabled = true,
    config = function()
      vim.o.background = 'light'
      vim.g.gruvbox_material_enable_bold = true
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_transparent_background = true
      vim.g.gruvbox_material_dim_inactive_windows = false
      vim.g.gruvbox_material_disable_italic_comment = false
      vim.g.gruvbox_material_diagnostic_text_highlight = true
      vim.g.gruvbox_material_background = 'hard' -- hard, medium, soft
      vim.g.gruvbox_material_diagnostic_virtual_text = 'colored' -- grey, colored, highlighted
      vim.g.gruvbox_material_spell_foreground = 'colored' -- none
      vim.g.gruvbox_material_ui_contrast = 'low' -- 'high'
      vim.g.gruvbox_material_show_eob = true
      vim.g.gruvbox_material_current_word = 'underline'
      -- vim.g.gruvbox_material_menu_selection_background = 'red'
      vim.g.gruvbox_material_float_style = 'bright' -- 'bright', 'dim'
      vim.g.gruvbox_material_foreground = 'orignal' -- 'material' 'original' 'mix'
      vim.g.gruvbox_material_diagnostic_line_highlight = true
      vim.g.gruvbox_material_visual = 'grey background' -- 'reverse'
      vim.g.gruvbox_material_inlay_hints_background = 'none' -- 'dimmed'
      vim.cmd('colorscheme gruvbox-material')
      if vim.o.background == 'light' then
        vim.api.nvim_set_hl(0, 'LineNr', { fg = '#7c6f64' })
      end
    end,
  },

  --[[ { -- https://github.com/folke/tokyonight.nvim
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    enabled = true,
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
}
