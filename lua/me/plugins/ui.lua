return {

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
    enabled = false,
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
    branch = "fix/E36",
    dependencies = {
      "smiteshp/nvim-navic",
    },
    config = function()
      local icons = require("me.config.icons").icons
      require("barbecue").setup({
        show_modified = true,
        symbols = {
          separator = ">",
        },
        kinds = icons.lsp.kinds,
      })
    end,
    enabled = true,
  },

  {
    "tzachar/local-highlight.nvim",
    event = "VeryLazy",
    config = function()
      vim.api.nvim_set_hl(0, "LocalHighlight", { underline = true, bold = true })
      require("local-highlight").setup({
        file_types = { "python", "cpp", "lua" },
        hlgroup = "LocalHighlight",
      })
    end,
  },

  {
    dir = tostring(os.getenv("HOME")) .. "/dev/lua/stat.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
    opts = {},
    event = "VeryLazy",
    enabled = true,
    config = true,
  },
}
