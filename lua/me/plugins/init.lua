return {
  { -- https://github.com/folke/which-key.nvim
    "folke/which-key.nvim",
    lazy = true,
    config = {
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 15, -- spacing between columns
        align = "center", -- align columns left, center or right
      },
    },
  },
  { -- https://github.com/dstein64/vim-startuptime
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  },
  { -- https://github.com/kyazdani42/nvim-web-devicons
    "kyazdani42/nvim-web-devicons",
  },
  { -- https://github.com/numToStr/Comment.nvim
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = true,
  },
  { -- https://github.com/Vimjas/vim-python-pep8-indent
    "Vimjas/vim-python-pep8-indent",
    ft = { "py", "python" },
  },
  { -- https://github.com/ggandor/leap.nvim
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end,
    enabled = true,
  },
  { -- https://github.com/utilyre/barbecue.nvim
    "utilyre/barbecue.nvim",
    dependencies = {
      "smiteshp/nvim-navic",
    },
    enabled = true,
    config = function()
      require("barbecue").setup({
        show_modified = false,
        symbols = {
          separator = ">",
        },
      })
    end,
  },
  { -- https://github.com/liuchengxu/vista.vim
    "liuchengxu/vista.vim",
    keys = {
      { "<F2>", "<CMD>Vista!!<CR>", desc = "Vista toggle" },
    },
    config = function()
      vim.g.vista_sidebar_width = 45
    end,
  },
  { -- https://github.com/folke/todo-comments.nvim
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "BufReadPost",
    config = true,
  },
  { -- https://github.com/stevearc/dressing.nvim
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    enabled = false,
  },
  { -- https://github.com/RRethy/vim-illuminate
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    enabled = true,
    keys = {
      {
        "<leader>]",
        function()
          require("illuminate").goto_next_reference(false)
        end,
        desc = "Next Reference",
      },
      {
        "<leader>[",
        function()
          require("illuminate").goto_prev_reference(false)
        end,
        desc = "Prev Reference",
      },
    },
  },
  { -- https://github.com/doums/monark.nvim
    "doums/monark.nvim",
    event = "VeryLazy",
    enabled = false,
    config = function()
      require("monark").setup()
      local hl = vim.api.nvim_set_hl
      hl(0, "monarkInsert", { fg = "#4abaaf" })
      hl(0, "monarkNormal", { fg = "#7aa2f7" })
      hl(0, "monarkReplace", { fg = "#9d7cd8" })
      hl(0, "monarkVisual", { fg = "#f7768e" })
    end,
  },
  { -- https://github.com/Abstract-IDE/penvim
    "Abstract-IDE/penvim",
    config = false,
  },
  { -- https://github.com/baskerville/vim-sxhkdrc
    "baskerville/vim-sxhkdrc",
    ft = { "sxhkdrc" },
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
  { -- https://github.com/j-hui/fidget.nvim
    "j-hui/fidget.nvim",
    config = {
      text = {
        spinner = "moon",
      },
      align = {
        bottom = true,
      },
      window = {
        relative = "editor",
      },
    },
  },
}
