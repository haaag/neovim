-- tokyonight.lua
-- https://github.com/folke/tokyonight.nvim

local M = {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  enabled = true,
}

function M.config()
  -- vim.o.background = "dark"
  local tokyonight = require("tokyonight")
  tokyonight.setup({
    style = "storm",
    -- hide_inactive_statusline = false,
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
    styles = {},
    -- luacheck: ignore
    on_colors = function(c) end,
    on_highlights = function(hl, c)
      -- make the current line cursor orange
      hl.CursorLineNr = { fg = c.orange, bold = true }

      if true then
        -- borderless telescope
        local prompt = "#2d3149"
        hl.TelescopeNormal = {
          bg = c.bg_dark,
          fg = c.fg_dark,
        }
        hl.TelescopeBorder = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopePromptNormal = {
          bg = prompt,
        }
        hl.TelescopePromptBorder = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopePromptTitle = {
          bg = c.fg_gutter,
          fg = c.orange,
        }
        hl.TelescopePreviewTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopeResultsTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
      end
    end,
  })
  tokyonight.load()
end

return M
