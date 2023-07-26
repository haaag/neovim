-- telescope.lua
-- https://github.com/nvim-telescope/telescope.nvim

return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  version = "0.1.x",
  cmd = { "Telescope" },
  enabled = true,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-project.nvim" },
    -- { "nvim-telescope/telescope-dap.nvim" },
  },
    -- stylua: ignore
    -- luacheck: ignore
  keys = {
    -- search
    { "<C-p>", "<CMD>Telescope find_files theme=get_ivy<CR>", desc = "Search Files" },
    { "<leader>?", "<CMD>Telescope oldfiles<CR>", desc = "[?] Find recently opened files" },
    { "<leader>sp", "<CMD>lua require'telescope'.extensions.project.project{ display_type = 'full' }<CR>", desc = "[S]earch [P]roject" },
    { "<leader>sr", "<CMD>Telescope resume<CR>", desc = "[S]earch [R]esume" },
    { "<leader>sw", "<CMD>Telescope grep_string<CR>", desc = "[S]earch current [W]ord" },
    { "<leader>sg", "<CMD>Telescope live_grep<CR>", desc = "[S]earch by [G]rep" },
    { "<leader>sd", "<CMD>Telescope diagnostics<CR>", desc = "[S]earch [D]iagnostics" },
    { "<leader>sh", "<CMD>Telescope help_tags<CR>", desc = "[S]earch [H]elp" },
    { "<leader>su", "<CMD>Telescope undo<CR>", desc = "[S]earch [U]ndo" },
    { "<leader>sk", "<CMD>Telescope keymaps<CR>", desc = "[S]earch [K]eymaps" },
    { "<leader>:", "<CMD>Telescope command_history<CR>", desc = "[S]earch Command History" },
    {
      "<leader><space>",
      "<CMD>lua require('telescope.builtin').buffers(require('telescope.themes').get_cursor({ previewer = false }))<CR>",
      desc = "[S]earch Buffers",
    },
    {
      "<leader>/",
      "<CMD>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_ivy({previewer = false}))<CR>",
      desc = "[/] Fuzzily search in current buffer]",
    },
  },
  init = function()
    -- Enable telescope fzf native
    pcall(require("telescope").load_extension, "fzf")

    -- Enable telescope project
    pcall(require("telescope").load_extension, "project")

    -- Enable telescope dap
    -- pcall(require("telescope").load_extension, "dap")
  end,
}
