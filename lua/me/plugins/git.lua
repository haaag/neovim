return {

  -- neogit
  { -- https://github.com/TimUntersberger/neogit
    "TimUntersberger/neogit",
    cmd = "Neogit",
    opts = {
      kind = "split",
      signs = {
        -- { CLOSED, OPENED }
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
  { -- https://github.com/lewis6991/gitsigns.nvim
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "▸" },
        topdelete = { text = "▾" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          if type(opts) == "string" then
            opts = { desc = opts }
          end
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- stylua: ignore start
        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "[S]tage Hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "[R]eset Hunk")
        map("n", "]p", gs.preview_hunk, "[P]review [H]unk")
        map("n", "<leader>ghS", gs.stage_buffer, "[S]tage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "[U]ndo Stage [H]unk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gs.preview_hunk, "[P]review [H]unk")
        map("n", "<leader>gb", gs.toggle_current_line_blame, "[G]it Toggle [B]lame")
        map("n", "<leader>ghb", function()
          gs.blame_line({ full = true })
        end, "Show [B]lame Line")
        map("n", "<leader>ghd", gs.diffthis, "[D]iff This [H]unk")
        map("n", "<leader>ghD", function()
          gs.diffthis("~")
        end, "Diff This ~")
        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
    enabled = true,
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
  },
  enabled = true,
}
