return {

  { -- https://github.com/folke/tokyonight.nvim
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
  },

  { -- https://github.com/ellisonleao/gruvbox.nvim
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    enabled = true,
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
      -- vim.o.background = 'light'
      vim.cmd('colorscheme gruvbox')
    end,
  },

  --[[ { -- https://github.com/sainnhe/gruvbox-material
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    enabled = false,
    config = function()
      -- vim.o.background = "light"
      vim.o.background = 'dark'
      vim.g.gruvbox_material_enable_bold = false
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_transparent_background = true
      vim.g.gruvbox_material_dim_inactive_windows = false
      vim.g.gruvbox_material_disable_italic_comment = false
      vim.g.gruvbox_material_diagnostic_text_highlight = true
      vim.g.gruvbox_material_background = 'hard' -- hard, medium, soft
      vim.g.gruvbox_material_diagnostic_virtual_text = 'colored' -- grey, colored, highlighted
      vim.g.gruvbox_material_spell_foreground = 'colored' -- none
      vim.g.gruvbox_material_ui_contrast = 'low' -- 'low' 'high'
      vim.g.gruvbox_material_show_eob = true -- Whether to show hl-EndOfBuffer
      vim.g.gruvbox_material_current_word = 'underline' -- 'grey background', 'bold', 'underline', 'italic'
      vim.g.gruvbox_material_diagnostic_line_highlight = false
      vim.g.gruvbox_material_menu_selection_background = 'red'
      vim.g.gruvbox_material_float_style = 'bright' -- 'bright', 'dim'
      vim.g.gruvbox_material_foreground = 'material' -- 'material', 'mix', 'original'
      -- vim.g.gruvbox_material_visual = "reverse"
      vim.cmd('colorscheme gruvbox-material')
    end,
  }, ]]

  --[[ { -- https://github.com/marko-cerovac/material.nvim
    "marko-cerovac/material.nvim",
    lazy = false,
    priority = 1000,
    enabled = false,
    opts = {
      contrast = {
        terminal = true, -- Enable contrast for the built-in terminal
        sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
        floating_windows = true, -- Enable contrast for floating windows
        cursor_line = false, -- Enable darker background for the cursor line
        non_current_windows = false, -- Enable darker background for non-current windows
        filetypes = { "neo-tree", "toggleterm", "mason" }, -- Specify which filetypes get the contrasted (darker) background
      },
      styles = {
        comments = { italic = true },
        strings = {},
        keywords = {},
        functions = { bold = true },
        variables = {},
        operators = {},
        types = {},
      },

      plugins = {
        "dap",
        "gitsigns",
        "indent-blankline",
        "mini",
        "neogit",
        "nvim-cmp",
        "nvim-web-devicons",
        "telescope",
        "trouble",
        "which-key",
        "nvim-navic",
      },

      disable = {
        colored_cursor = true, -- Disable the colored cursor
        borders = false, -- Disable borders between vertically split windows
        background = true, -- Prevent the theme from setting the background
        -- term_colors = false, -- Prevent the theme from setting terminal colors
        -- eob_lines = false, -- Hide the end-of-buffer lines
      },
    },
    config = function(_, opts)
      require("material").setup(opts)
      vim.g.material_style = "deep ocean"
      vim.g.material_disable_background = true
      vim.cmd("colorscheme material")
    end,
  }, ]]
}
