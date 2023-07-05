return {
  { -- https://github.com/folke/which-key.nvim
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register({
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader>b"] = { name = "+buffers" },
        ["<leader>d"] = { name = "+debugging" },
        ["<leader>dp"] = { name = "+python" },
        ["<leader>ds"] = { name = "+step" },
        ["<leader>e"] = { name = "+edits" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>gt"] = { name = "+telescope" },
        ["<leader>gd"] = { name = "+diff" },
        ["<leader>gh"] = { name = "+hunks" },
        ["<leader>l"] = { name = "+lsp" },
        ["<leader>lw"] = { name = "+workspace" },
        ["<leader>m"] = { name = "+misc" },
        ["<leader>s"] = { name = "+search" },
        ["<leader>t"] = { name = "+test" },
        ["<leader>q"] = { name = "+quickfix" },
        ["<leader>qs"] = { name = "+sessions" },
        ["<leader>x"] = { name = "+diagnostics" },
      })
    end,
    enabled = true,
  },

  --[[ { -- https://github.com/ggandor/leap.nvim
    "ggandor/leap.nvim",
    event = "VeryLazy",
    dependencies = { { "ggandor/flit.nvim", opts = { labeled_modes = "nv" } } },
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
    end,
    enabled = true,
  }, ]]

  { -- https://github.com/liuchengxu/vista.vim
    "liuchengxu/vista.vim",
    keys = {
      { "<F2>", "<CMD>Vista!!<CR>", desc = "Vista toggle" },
    },
    config = function()
      vim.g.vista_sidebar_width = 45
    end,
    enabled = true,
  },

  { -- https://github.com/folke/todo-comments.nvim
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "BufReadPost",
    opts = {
      keywords = {
        WIP = { icon = " ", color = "warning" },
      },
    },
    config = function(_, opts)
      require("todo-comments").setup(opts)
    end,
    -- stylua: ignore
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
      { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME,WIP,NOTE,HACK<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "[S]earch [T]odo" },
    },
    enabled = true,
  },

  { -- https://github.com/folke/trouble.nvim
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
    keys = {
      -- stylua: ignore
      { "<leader>xx", "<CMD>TroubleToggle document_diagnostics<CR>", desc = "Document Diagnostics (Trouble)" },
      { "<leader>xX", "<CMD>TroubleToggle workspace_diagnostics<CR>", desc = "Workspace Diagnostics (Trouble)" },
    },
    enabled = true,
  },

  { -- https://github.com/j-hui/fidget.nvim
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    tag = "legacy",
    opts = {
      text = { spinner = "dots_pulse" }, -- dots_pulse, bouncing_bar
      align = { bottom = true },
      window = { relative = "editor", blend = 0 }, -- border = "rounded",
      sources = { ["efm"] = { ignore = true } },
    },
    enabled = true,
  },
}
