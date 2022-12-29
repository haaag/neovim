-- telescope.lua
-- https://github.com/nvim-telescope/telescope.nvim

local map = vim.keymap.set
local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
        ["<esc>"] = actions.close,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>?", "<CMD>Telescope oldfiles<CR>", { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", "<CMD>Telescope buffers<CR>", { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = "[/] Fuzzily search in current buffer]" })

vim.keymap.set("n", "<C-p>", "<CMD>Telescope find_files<CR>", { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sh", "<CMD>Telescope help_tags<CR>", { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", "<CMD>Telescope grep_string<CR>", { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", "<CMD>Telescope live_grep<CR>", { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", "<CMD>Telescope diagnostics<CR>", { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>gg", "<CMD>Telescope git_commits<CR>", { desc = "TCommits" })
vim.keymap.set("n", "<leader>gc", "<CMD>Telescope git_bcommits<CR>", { desc = "TBranch commits" })
vim.keymap.set("n", "<leader>gb", "<CMD>Telescope git_branches<CR>", { desc = "TBranches" })