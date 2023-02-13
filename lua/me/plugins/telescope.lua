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
    { "nvim-telescope/telescope-project.nvim" }, -- https://github.com/nvim-telescope/telescope-project.nvim
    { "nvim-telescope/telescope-frecency.nvim", dependencies = { "kkharji/sqlite.lua" } },
    -- { "debugloop/telescope-undo.nvim" }, -- https://github.com/debugloop/telescope-undo.nvim
    -- { "nvim-telescope/telescope-dap.nvim" },
  },
    -- stylua: ignore
    -- luacheck: ignore
  keys = {
    -- search
    { "<C-p>", "<CMD>Telescope find_files<CR>", desc = "Search Files" },
    -- { "<C-p>", "<CMD>Telescope find_files theme=ivy<CR>", desc = "Search Files" },
    {
      "<C-b>",
      "<CMD>lua require('telescope.builtin').buffers(require('telescope.themes').get_cursor({ previewer = false }))<CR>",
      desc = "[S]earch Buffers",
    },
    { "<leader><leader>", "<CMD>lua require('telescope').extensions.frecency.frecency({ workspace = 'CWD' })<CR>", desc = "Telescope frecency", },
    { "<leader>?", "<CMD>Telescope oldfiles<CR>", desc = "[?] Find recently opened files" },
    { "<leader><leader>?", "<CMD>lua require('telescope').extensions.frecency.frecency()<CR>", desc = "[?] Find recently opened (frecency)", },
    { "<leader>sp", "<CMD>Telescope project<CR>", desc = "[S]earch [P]roject" },
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
      "<CMD>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({ previewer = false }))<CR>",
      desc = "[S]earch Buffers",
    },
    {
      "<leader>/",
      "<CMD>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_ivy({winblend = 10, previewer = false}))<CR>",
      desc = "[/] Fuzzily search in current buffer]",
    },
  },
  init = function()
    -- Enable telescope fzf native
    pcall(require("telescope").load_extension, "fzf")

    -- Enable telescope undo
    -- pcall(require("telescope").load_extension, "undo")

    -- Enable telescope project
    pcall(require("telescope").load_extension, "project")

    -- Enable frecency
    pcall(require("telescope").load_extension, "frecency")

    -- Enable telescope dap
    -- pcall(require("telescope").load_extension, "dap")
  end,
}
