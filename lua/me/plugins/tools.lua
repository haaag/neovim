return {
  { -- https://github.com/matbme/JABS.nvim
    "matbme/JABS.nvim",
    config = {
      position = { "center", "center" },
      relative = "editor",
    },
    keys = {
      { "<leader><space>", "<CMD>JABSOpen<CR>", desc = "[ ] Find existing buffers" },
    },
  },
  { -- https://github.com/baskerville/vim-sxhkdrc
    "baskerville/vim-sxhkdrc",
    ft = { "sxhkdrc" },
    enabled = true,
  },
  { -- https://github.com/Vimjas/vim-python-pep8-indent
    "Vimjas/vim-python-pep8-indent",
    ft = { "py", "python" },
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
  { -- https://github.com/echasnovski/mini.bufremove
    "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "[B]uffer [d]elete" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "[B]uffer [D]elete (Force)" },
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
  { -- https://github.com/dstein64/vim-startuptime
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },
  { -- https://github.com/kyazdani42/nvim-web-devicons
    "kyazdani42/nvim-web-devicons",
  },
}
