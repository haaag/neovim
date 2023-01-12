return {
  { -- https://github.com/folke/tokyonight.nvim
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    enabled = true,
    opts = function()
      return {
        style = "storm",
        sidebars = {
          "qf",
          "vista_kind",
          "vista",
          "terminal",
          "toggleterm",
          "spectre_panel",
          "NeogitStatus",
          "help",
          "startuptime",
          "Outline",
        },
        transparent = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = { bold = true },
          variables = {},
          sidebars = "dark", -- "dark", "transparent" or "normal"
          floats = "dark", -- "dark", "transparent" or "normal"
        },
        on_highlights = function(hl, c)
          hl.CursorLineNr = { fg = c.orange, bold = true }
          hl.LineNr = { fg = c.orange, bold = true }
          hl.LineNrAbove = { fg = c.fg_gutter }
          hl.LineNrBelow = { fg = c.fg_gutter }
          local prompt = "#2d3149"
          hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
          hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
          hl.TelescopePromptNormal = { bg = prompt }
          hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
          hl.TelescopePromptTitle = { bg = c.fg_gutter, fg = c.orange }
          hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
          hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
        end,
      }
    end,
    config = function(_, opts)
      local tokyonight = require("tokyonight")
      tokyonight.setup(opts)
      tokyonight.load()
    end,
  },

  -- gruvbox
  { -- https://github.com/sainnhe/gruvbox-material
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    enabled = false,
    init = function()
      local g = vim.g
      g.gruvbox_material_enable_bold = true
      g.gruvbox_material_enable_italic = true
      g.gruvbox_material_transparent_background = false
      g.gruvbox_material_dim_inactive_windows = false
      g.gruvbox_material_disable_italic_comment = false
      g.gruvbox_material_diagnostic_text_highlight = false
      g.gruvbox_material_background = "medium" -- hard, medium, soft
      g.gruvbox_material_foreground = "mix" -- material, mix, original
    end,
    config = function(_, _)
      vim.cmd("colorscheme gruvbox-material")
    end,
  },
}
