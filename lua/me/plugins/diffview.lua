-- diffview.lua
-- https://github.com/sindrets/diffview.nvim
-- Single tabpage interface for easily cycling through diffs

return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  config = true,
}
