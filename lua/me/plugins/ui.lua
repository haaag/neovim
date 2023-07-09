return {

  { -- https://github.com/nvim-tree/nvim-web-devicons
    "nvim-tree/nvim-web-devicons",
  },

  { -- https://github.com/szw/vim-maximizer
    "szw/vim-maximizer",
    cmd = "MaximizerToggle",
    config = function()
      vim.g.maximizer_set_default_mapping = 1
    end,
    keys = {
      { "<C-w>m", "<CMD>MaximizerToggle<CR>", desc = "[B]uffer [M]aximizer" },
    },
    enabled = true,
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
    enabled = true,
  },

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

  { -- active indent guide and indent text objects
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = "BufReadPre",
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
    config = function(_, opts)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
      require("mini.indentscope").setup(opts)
    end,
    enabled = true,
  },

  { -- https://github.com/tzachar/local-highlight.nvim
    "tzachar/local-highlight.nvim",
    lazy = false,
    -- event = "VeryLazy",
    config = function()
      -- local theme = require("me.config.colors").current()
      vim.api.nvim_set_hl(0, "MyLocalHighlight", {
        -- bg = theme.darkgrey,
        underline = true,
        bold = true,
      })
      require("local-highlight").setup({
        hlgroup = "MyLocalHighlight",
      })
    end,
  },

  {
    "lukas-reineke/virt-column.nvim",
    event = "VeryLazy",
    config = true,
  },

  {
    dir = tostring(os.getenv("HOME")) .. "/dev/lua/stat.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
    event = "VeryLazy",
    enabled = true,
    config = true,
  },

  { -- https://github.com/utilyre/sentiment.nvim
    "utilyre/sentiment.nvim",
    name = "sentiment",
    event = "VeryLazy",
    version = "*",
    config = true,
    enabled = true,
  },

  {
    "b0o/incline.nvim",
    event = "VeryLazy",
    config = true,
  },
}
