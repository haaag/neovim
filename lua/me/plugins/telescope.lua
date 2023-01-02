-- telescope.lua
-- https://github.com/nvim-telescope/telescope.nvim

local M = {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  cmd = { "Telescope" },
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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

  -- Enable telescope fzf native, if installed
  pcall(require("telescope").load_extension, "fzf")
  local builtin = require("telescope.builtin")
  local themes = require("telescope.themes")

  vim.keymap.set("n", "<leader>?", "<CMD>Telescope oldfiles<CR>", { desc = "[?] Find recently opened files" })
  vim.keymap.set("n", "<leader>/", function()
    require("telescope.builtin").current_buffer_fuzzy_find(themes.get_ivy({
      winblend = 10,
      previewer = false,
    }))
  end, { desc = "[/] Fuzzily search in current buffer]" })

  vim.keymap.set("n", "<leader><space>", function()
    builtin.buffers(themes.get_dropdown({ hidden = true, previewer = false }))
  end, { desc = "[ ] Find existing buffers" })

  vim.keymap.set("n", "<C-p>", function()
    builtin.find_files()
  end, { desc = "[S]earch [F]iles" })

  vim.keymap.set("n", "<leader>sf", "<CMD>Telescope find_files<CR>", { desc = "[S]earch [F]iles" })
  vim.keymap.set("n", "<leader>sh", function()
    builtin.help_tags(themes.get_ivy({ hidden = true, previewer = false }))
  end, { desc = "[S]earch [H]elp" })
  vim.keymap.set("n", "<leader>sw", "<CMD>Telescope grep_string<CR>", { desc = "[S]earch current [W]ord" })
  vim.keymap.set("n", "<leader>sg", "<CMD>Telescope live_grep<CR>", { desc = "[S]earch by [G]rep" })
  vim.keymap.set("n", "<leader>sd", "<CMD>Telescope diagnostics<CR>", { desc = "[S]earch [D]iagnostics" })

  -- git
  vim.keymap.set("n", "<leader>gc", "<CMD>Telescope git_commits<CR>", { desc = "[G]it Telescope [C]ommits" })
  vim.keymap.set("n", "<leader>gb", "<CMD>Telescope git_branches<CR>", { desc = "[G]it Telescope [B]ranches" })
end

return M
