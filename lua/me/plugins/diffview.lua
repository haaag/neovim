-- diffview.lua
-- https://github.com/sindrets/diffview.nvim
-- Single tabpage interface for easily cycling through diffs

return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  config = true,
  keys = {
    { "<leader>gdo", "<CMD>DiffviewOpen<CR>", desc = "[D]iffview [O]pen" },
    { "<leader>gdc", "<CMD>DiffviewClose<CR>", desc = "[D]iffview [C]lose" },
    { "<leader>gdf", "<CMD>DiffviewToggleFiles<CR>", desc = "[D]iffview [F]iles" },
    { "<leader>gdh", "<CMD>DiffviewFileHistory %<CR>", desc = "[D]iffview file [H]istory" },
  },
}
