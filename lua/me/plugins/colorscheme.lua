return {

  --[[ { -- https://github.com/folke/tokyonight.nvim
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    enabled = false,
    opts = function()
      return {
        style = "night",
        sidebars = {
          "qf",
          "vista_kind",
          "vista",
          "terminal",
          "toggleterm",
          "spectre_panel",
          "neogitstatus",
          "help",
          "startuptime",
          "outline",
        },
        transparent = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = { bold = false },
          variables = {},
          sidebars = "normal", -- "dark", "transparent" or "normal"
          floats = "normal", -- "dark", "transparent" or "normal"
        },
        on_highlights = function(hl, c)
          local prompt = "#2d3149"
          hl.cursorlinenr = { fg = c.orange, bold = true }
          hl.linenr = { fg = c.orange, bold = true }
          hl.linenrabove = { fg = c.fg_gutter }
          hl.linenrbelow = { fg = c.fg_gutter }
          hl.telescopenormal = { bg = c.bg_dark, fg = c.fg_dark }
          hl.telescopeborder = { bg = c.bg_dark, fg = c.bg_dark }
          hl.telescopepromptnormal = { bg = prompt }
          hl.telescopepromptborder = { bg = prompt, fg = prompt }
          hl.telescopeprompttitle = { bg = c.fg_gutter, fg = c.orange }
          hl.telescopepreviewtitle = { bg = c.bg_dark, fg = c.bg_dark }
          hl.telescoperesultstitle = { bg = c.bg_dark, fg = c.bg_dark }
        end,
      }
    end,
    config = function(_, opts)
      local tokyonight = require("tokyonight")
      tokyonight.setup(opts)
      tokyonight.load()
    end,
  }, ]]

  -- gruvbox
  { -- https://github.com/sainnhe/gruvbox-material
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    enabled = true,
    config = function()
      -- vim.o.background = "light"
      vim.o.background = 'dark'
      vim.g.gruvbox_material_enable_bold = false
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_transparent_background = true
      vim.g.gruvbox_material_dim_inactive_windows = false
      vim.g.gruvbox_material_disable_italic_comment = false
      vim.g.gruvbox_material_diagnostic_text_highlight = false
      vim.g.gruvbox_material_background = 'hard' -- hard, medium, soft
      vim.g.gruvbox_material_diagnostic_virtual_text = 'colored' -- grey, colored, highlighted
      vim.g.gruvbox_material_spell_foreground = 'colored' -- none
      vim.g.gruvbox_material_ui_contrast = 'high' -- 'low' 'high'
      vim.g.gruvbox_material_show_eob = 0
      vim.g.gruvbox_material_current_word = 'underline'
      -- vim.g.gruvbox_material_visual = "reverse"
      vim.g.gruvbox_material_diagnostic_line_highlight = true
      vim.cmd('colorscheme gruvbox-material')
    end,
  },

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
