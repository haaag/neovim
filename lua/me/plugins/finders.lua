-- finders.lua

return {
  { -- https://github.com/nvim-telescope/telescope.nvim

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
  },

  { -- https://github.com/neo-tree.nvim
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader><F3>", "<CMD>Neotree current %:p:h:h %:p<CR>", desc = "NeoTree Current" },
      { "<F3>", "<CMD>Neotree toggle<CR>", desc = "NeoTree Toggle" },
    },
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,
    opts = {
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = true,
      },
      window = {
        position = "right",
        width = 30,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ["<space>"] = {
            "toggle_node",
            nowait = false,
          },
          ["<2-LeftMouse>"] = "open",
          ["<cr>"] = "open",
          ["o"] = "open",
          ["S"] = "open_split",
          ["s"] = "open_vsplit",
          ["t"] = "open_tabnew",
          ["w"] = "open_with_window_picker",
          ["C"] = "close_node",
          ["a"] = "add",
          ["A"] = "add_directory",
          ["d"] = "delete",
          ["r"] = "rename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["c"] = "copy", -- takes text input for destination
          ["m"] = "move", -- takes text input for destination
          ["q"] = "close_window",
          ["R"] = "refresh",
        },
      },
    },
  },

  { -- https://github.com/ggandor/leap.nvim
    "ggandor/leap.nvim",
    event = "VeryLazy",
    dependencies = { -- https://github.com/ggandor/flit.nvim
      { "ggandor/flit.nvim", opts = { labeled_modes = "nv" } },
    },
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
    end,
    enabled = true,
  },
}
