return {
  { -- https://github.com/folke/which-key.nvim
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({
        show_help = false,
        plugins = { spelling = true },
        layout = {
          height = { min = 4, max = 25 }, -- min and max height of the columns
          width = { min = 20, max = 50 }, -- min and max width of the columns
          spacing = 15, -- spacing between columns
          align = "center", -- align columns left, center or right
        },
      })
      wk.register({
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader>d"] = { name = "+databases" },
        ["<leader>e"] = { name = "+edits" },
        ["<leader>b"] = { name = "+buffers" },
        ["<leader>g"] = { name = "+git", d = { name = "+diff" }, h = { name = "+hunk" } },
        ["<leader>l"] = { name = "+lsp", w = { name = "+workspace" } },
        ["<leader>s"] = { name = "+search" },
        ["<leader>q"] = { name = "+quickfix" },
      })
    end,
  },
  { -- https://github.com/numToStr/Comment.nvim
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = true,
  },
  { -- https://github.com/ggandor/leap.nvim
    "ggandor/leap.nvim",
    event = "VeryLazy",
    dependencies = { { "ggandor/flit.nvim", config = { labeled_modes = "nv" } } },
    config = function()
      require("leap").add_default_mappings(true)
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
  },
  { -- https://github.com/RRethy/vim-illuminate
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    enabled = true,
    keys = {
      {
        "<space>]",
        function()
          require("illuminate").goto_next_reference(false)
        end,
        desc = "Next Reference",
      },
      {
        "<space>[",
        function()
          require("illuminate").goto_prev_reference(false)
        end,
        desc = "Prev Reference",
      },
    },
  },
  { -- https://github.com/Abstract-IDE/penvim
    "Abstract-IDE/penvim",
    config = true,
  },
  { -- https://github.com/j-hui/fidget.nvim
    "j-hui/fidget.nvim",
    config = {
      text = {
        spinner = "moon", -- dots_pulse, bouncing_bar
      },
      align = {
        bottom = true,
      },
      window = {
        relative = "editor",
        blend = 0,
        -- border = "rounded",
      },
      sources = {
        ["efm"] = {
          ignore = true,
        },
      },
    },
    enabled = true,
  },
}
