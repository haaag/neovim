return {

  -- neogit
  { -- https://github.com/TimUntersberger/neogit
    "TimUntersberger/neogit",
    cmd = "Neogit",
    opts = {
      kind = "split",
      signs = {
        section = { "", "" },
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
  { -- https://github.com/lewis6991/gitsigns.nvim
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
      { "]h", "<CMD>Gitsigns next_hunk<CR>", desc = "Git Next [H]unk" },
      { "[h", "<CMD>Gitsigns prev_hunk<CR>", desc = "Git Prev [H]unk" },
      { "]p", "<CMD>Gitsigns preview_hunk<CR>", desc = " Git [P]review [H]unk" },
      { "<leader>gb", "<CMD>Gitsigns toggle_current_line_blame<CR>", desc = "Git [G]it Toggle [B]lame" },
      { "<leader>mtg", "<CMD>Gitsigns toggle_signs<CR>", desc = "[G]it [T]oggle signs" },
      -- telescope
      { "<leader>gts", "<CMD>Telescope git_status<CR>", desc = "[G]it [T]elescope [S]tatus" },
      { "<leader>gtx", "<CMD>Telescope git_stash<CR>", desc = "[G]it [T]elescope stash" },
      { "<leader>gtb", "<CMD>Telescope git_branches<CR>", desc = "[G]it [T]elescope [B]ranches" },
      -- hunks
      { "<leader>ghs", "<CMD>Gitsigns stage_hunk<CR>", desc = "Git [S]tage Hunk", mode = { "n", "v" } },
      { "<leader>ghr", "<CMD>Gitsigns reset_hunk<CR>", desc = "Git [R]eset Hunk", mode = { "n", "v" } },
      { "<leader>ghS", "<CMD>Gitsigns stage_buffer<CR>", desc = "Git [S]tage Buffer" },
      { "<leader>ghu", "<CMD>Gitsigns undo_stage_hunk<CR>", desc = "Git [U]ndo Stage [H]unk" },
      { "<leader>ghR", "<CMD>Gitsigns reset_buffer<CR>", desc = "Git Reset Buffer" },
      { "<leader>ghp", "<CMD>Gitsigns preview_hunk<CR>", desc = "Git [P]review [H]unk" },
      { "<leader>ghb", '<CMD>lua require"gitsigns".blame_line{full=true}<CR>', desc = "Git Show [B]lame Line" },
      { "<leader>ghd", "<CMD>Gitsigns diffthis<CR>", desc = "Git [D]iff This [H]unk" },
      { "<leader>ghD", '<CMD>lua require"gitsigns".diffthis("~")<CR>', desc = "Git Diff This ~" },
      { "ih", ":<C-U>Gitsigns select_hunk<CR>", desc = "Git Select Hunk", mode = { "o", "x" } },
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
