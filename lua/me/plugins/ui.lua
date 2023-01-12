return {

  -- tabline
  { -- https://github.com/echasnovski/mini.tabline
    "echasnovski/mini.tabline",
    event = "VeryLazy",
    config = function()
      require("mini.tabline").setup({})
    end,
    enabled = true,
  },

  { -- https://github.com/kyazdani42/nvim-web-devicons
    "kyazdani42/nvim-web-devicons",
  },

  { -- https://github.com/szw/vim-maximizer
    "szw/vim-maximizer",
    cmd = "MaximizerToggle",
    config = function()
      vim.g.maximizer_set_default_mapping = 1
    end,
    keys = {
      { "<leader>bm", "<CMD>MaximizerToggle<CR>", desc = "[B]uffer [M]aximizer" },
    },
  },

  { -- https://github.com/doums/monark.nvim
    "doums/monark.nvim",
    event = "VeryLazy",
    enabled = false,
    config = function()
      local c = require("me.config.colors").current()
      require("monark").setup()
      local hl = vim.api.nvim_set_hl
      hl(0, "monarkInsert", { fg = c.cyan })
      hl(0, "monarkNormal", { fg = c.blue })
      hl(0, "monarkReplace", { fg = c.magenta })
      hl(0, "monarkVisual", { fg = c.red })
    end,
  },

  -- dressing.nvim
  { -- https://github.com/stevearc/dressing.nvim
    "stevearc/dressing.nvim",
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
    enabled = false,
  },

  -- indent blankline
  { -- https://github.com/lukas-reineke/indent-blankline.nvim
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    opts = {
      -- char = "▏",
      char = "│",
      filetype_exclude = { "help", "neo-tree", "Trouble", "lazy" },
      show_trailing_blankline_indent = false,
      show_current_context = false,
    },
    enabled = true,
  },

  -- winbar
  { -- https://github.com/utilyre/barbecue.nvim
    "utilyre/barbecue.nvim",
    event = "VeryLazy",
    dependencies = {
      "smiteshp/nvim-navic",
    },
    config = function()
      require("barbecue").setup({
        theme = "tokyonight",
        show_modified = false,
        symbols = {
          separator = ">",
        },
      })
    end,
    enabled = true,
  },

  { -- https://github.com/folke/styler.nvim
    "folke/styler.nvim",
    event = "VeryLazy",
    opts = {
      themes = {
        markdown = { colorscheme = "tokyonight-moon" },
        help = { colorscheme = "tokyonight-moon" },
      },
    },
    enabled = true,
  },
}
