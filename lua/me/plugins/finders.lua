-- finders.lua

return {
  { -- https://github.com/nvim-telescope/telescope.nvim
    'nvim-telescope/telescope.nvim',
    event = 'VeryLazy',
    version = '0.1.x',
    cmd = { 'Telescope' },
    enabled = true,
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { 'nvim-telescope/telescope-project.nvim' },
      -- { "nvim-telescope/telescope-dap.nvim" },
    },
    -- stylua: ignore
    -- luacheck: ignore
  keys = {
    -- search
    { "<C-p>", "<CMD>Telescope find_files theme=get_ivy<CR>", desc = "Search Files" },
    { "<leader>?", "<CMD>Telescope oldfiles<CR>", desc = "[?] Find recently opened files" },
    { "<leader>sp", "<CMD>lua require'telescope'.extensions.project.project{ display_type = 'full' }<CR>", desc = "Search Project" },
    { "<leader>sr", "<CMD>Telescope resume<CR>", desc = "Search Resume" },
    { "<leader>sw", "<CMD>Telescope grep_string<CR>", desc = "Search current [W]ord" },
    { "<leader>sg", "<CMD>Telescope live_grep<CR>", desc = "Search by Grep" },
    { "<leader>sd", "<CMD>Telescope diagnostics<CR>", desc = "Search Diagnostics" },
    { "<leader>sh", "<CMD>Telescope help_tags<CR>", desc = "Search Help" },
    { "<leader>su", "<CMD>Telescope undo<CR>", desc = "Search Undo" },
    { "<leader>sk", "<CMD>Telescope keymaps<CR>", desc = "Search Keymaps" },
    { "<leader>:", "<CMD>Telescope command_history<CR>", desc = "Search Command History" },
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
      pcall(require('telescope').load_extension, 'fzf')

      -- Enable telescope project
      pcall(require('telescope').load_extension, 'project')

      -- Enable telescope dap
      -- pcall(require("telescope").load_extension, "dap")
    end,
  },

  { -- https://github.com/stevearc/oil.nvim
    'stevearc/oil.nvim',
    opts = {},
    keys = {
      { '-', '<CMD>Oil<CR>', desc = 'Open parent directory' },
    },
    lazy = false,
    enabled = true,
  },

  { -- https://github.com/ggandor/flit.nvim
    'ggandor/flit.nvim',
    keys = function()
      local ret = {}
      for _, key in ipairs({ 'f', 'F', 't', 'T' }) do
        ret[#ret + 1] = { key, mode = { 'n', 'x', 'o' }, desc = key }
      end
      return ret
    end,
    opts = { labeled_modes = 'nx' },
    enabled = true,
  },

  { -- https://github.com/ggandor/leap.nvim
    'ggandor/leap.nvim',
    keys = {
      { 's', mode = { 'n', 'x', 'o' }, desc = 'Leap forward to' },
      { 'S', mode = { 'n', 'x', 'o' }, desc = 'Leap backward to' },
      { 'gs', mode = { 'n', 'x', 'o' }, desc = 'Leap from windows' },
    },
    config = function(_, opts)
      local leap = require('leap')
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ 'x', 'o' }, 'x')
      vim.keymap.del({ 'x', 'o' }, 'X')
    end,
    enabled = true,
  },
}
