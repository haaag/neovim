return {

  -- neogit
  { -- https://github.com/TimUntersberger/neogit
    "TimUntersberger/neogit",
    cmd = "Neogit",
    opts = {
      kind = "split",
      signs = {
        section = { "", "" },
        item = { "", "" },
        hunk = { "", "" },
      },
      integrations = { diffview = true },
    },
    keys = {
      { "<leader>go", "<CMD>Neogit<CR>", desc = "Neo[G]it [O]pen" },
    },
    enabled = true,
  },

  -- gitsings
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "‾" },
        topdelete = { text = "‾" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
    },
    keys = {
      { "]h", "<CMD>Gitsigns next_hunk<CR>", "Next [H]unk" },
      { "[h", "<CMD>Gitsigns prev_hunk<CR>", "Prev [H]unk" },
      { "<leader>ghs", ":Gitsigns stage_hunk<CR>", "[S]tage Hunk", mode = { "n", "v" } },
      { "<leader>ghr", ":Gitsigns reset_hunk<CR>", "[R]eset Hunk", mode = { "n", "v" } },

      { "]p", "<cmd>Gitsigns preview_hunk<CR>", "[P]review [H]unk" },
      { "<leader>ghS", "<cmd>Gitsigns stage_buffer<CR>", "[S]tage Buffer" },
      { "<leader>ghu", "<cmd>Gitsigns undo_stage_hunk<CR>", "[U]ndo Stage [H]unk" },
      { "<leader>ghR", "<cmd>Gitsigns reset_buffer<CR>", "Reset Buffer" },
      { "<leader>ghp", "<cmd>Gitsigns preview_hunk<CR>", "[P]review [H]unk" },
      { "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", "[G]it Toggle [B]lame" },
      { "<leader>ghb", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', "Show [B]lame Line" },
      { "<leader>ghd", "<cmd>Gitsigns diffthis<CR>", "[D]iff This [H]unk" },
      { "<leader>ghD", '<cmd>lua require"gitsigns".diffthis("~")<CR>', "Diff This ~" },
      { "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk", mode = { "o", "x" } },
    },
  },

  -- diffview.lua
  { -- https://github.com/sindrets/diffview.nvim
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = true,
    keys = {
      { "<leader>gdo", "<CMD>DiffviewOpen<CR>", desc = "[D]iffview [O]pen" },
      { "<leader>gdc", "<CMD>DiffviewClose<CR>", desc = "[D]iffview [C]lose" },
      { "<leader>gdf", "<CMD>DiffviewToggleFiles<CR>", desc = "[D]iffview [F]iles" },
      { "<leader>gdh", "<CMD>DiffviewFileHistory %<CR>", desc = "[D]iffview file [H]istory" },
    },
    enabled = true,
  },
}
