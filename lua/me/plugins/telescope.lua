-- telescope.lua
-- https://github.com/nvim-telescope/telescope.nvim

local M = {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  version = "0.1.x",
  cmd = { "Telescope" },
  enabled = true,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-project.nvim" }, -- https://github.com/nvim-telescope/telescope-project.nvim
    { "debugloop/telescope-undo.nvim" }, -- https://github.com/debugloop/telescope-undo.nvim
  },
  keys = {
    { "<leader>?", "<CMD>Telescope oldfiles<CR>", desc = "[?] Find recently opened files" },
    { "<C-p>", "<CMD>Telescope find_files<CR>", desc = "Search Files" },
    { "<leader>sp", "<CMD>Telescope project<CR>", desc = "[S]earch [P]roject" },
    { "<leader>sr", "<CMD>Telescope resume<CR>", desc = "[S]earch [R]esume" },
    { "<leader>sw", "<CMD>Telescope grep_string<CR>", desc = "[S]earch current [W]ord" },
    { "<leader>sg", "<CMD>Telescope live_grep<CR>", desc = "[S]earch by [G]rep" },
    { "<leader>sd", "<CMD>Telescope diagnostics<CR>", desc = "[S]earch [D]iagnostics" },
    { "<leader>gc", "<CMD>Telescope git_commits<CR>", desc = "[G]it Telescope [C]ommits" },
    { "<leader>gb", "<CMD>Telescope git_branches<CR>", desc = "[G]it Telescope [B]ranches" },
    { "<leader>sh", "<CMD>Telescope help_tags<CR>", desc = "[S]earch [H]elp" },
    { "<leader>su", "<CMD>Telescope undo<CR>", desc = "[S]earch [U]ndo" },
    {
      "<leader><space>",
      function()
        require("telescope.builtin").buffers(require("telescope.themes").get_dropdown({
          previewer = false,
        }))
      end,
      desc = "[S]earch [U]ndo",
    },
    {
      "<leader>/",
      function()
        require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_ivy({
          winblend = 10,
          previewer = false,
        }))
      end,
      desc = "[/] Fuzzily search in current buffer]",
    },
  },
}

function M.config()
  local telescope = require("telescope")
  local actions = require("telescope.actions")

  telescope.setup({
    defaults = {
      mappings = {
        i = {
          ["<C-u>"] = false,
          ["<C-d>"] = false,
          ["<esc>"] = actions.close,
        },
      },
    },
  })

  -- Enable telescope fzf native
  pcall(require("telescope").load_extension, "fzf")

  -- Enable telescope undo
  pcall(require("telescope").load_extension, "undo")

  -- Enable telescope project
  pcall(require("telescope").load_extension, "project")
end

return M
