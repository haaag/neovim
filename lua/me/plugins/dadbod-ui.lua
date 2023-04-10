-- vim-dadbod-ui
-- https://github.com/kristijanhusak/vim-dadbod-ui

return {}

--[[ local M = {
  "kristijanhusak/vim-dadbod-ui",
  cmd = { "DBUI" },
  dependencies = {
    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-completion",
    "tpope/vim-dotenv",
  },
  keys = {
    { "<leader>db", "<CMD>DBUI<CR>", desc = "[D]atabaseUI" },
    {
      "<leader>ds",
      function()
        return "<Plug>(DBUI_SaveQuery)"
      end,
      desc = "[D]atabase [S]ave Query",
    },
  },
  enabled = false,
}

function M.config()
  vim.g.db_ui_use_nerd_fonts = 1
  vim.g.db_ui_show_database_icon = 1
  vim.g.db_ui_force_echo_notifications = 1
  vim.g.db_ui_win_position = "right"
  vim.g.db_ui_winwidth = 80

  vim.g.db_ui_icons = {
    expanded = {
      db = "▾ ",
      buffers = "▾ ",
      saved_queries = "▾ ",
      schemas = "▾ ",
      schema = "▾ פּ",
      tables = "▾ 藺",
      table = "▾ ",
    },
    collapsed = {
      db = "▸ ",
      buffers = "▸ ",
      saved_queries = "▸ ",
      schemas = "▸ ",
      schema = "▸ פּ",
      tables = "▸ 藺",
      table = "▸ ",
    },
    saved_query = "",
    new_query = "璘",
    tables = "離",
    buffers = "﬘",
    add_connection = "",
    connection_ok = "✓",
    connection_error = "✕",
  }

  local misc = vim.api.nvim_create_augroup("MiscDBUI", { clear = true })
  vim.api.nvim_create_autocmd("BufWinEnter", {
    group = misc,
    pattern = "dbui",
    callback = function()
      vim.cmd("set cmdheight=1")
    end,
  })
end

return M ]]
