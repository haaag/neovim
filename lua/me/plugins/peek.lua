local M = {
  "toppair/peek.nvim",
  build = "deno task --quiet build:fast",
  ft = { "markdown" },
}

function M.config()
  require("peek").setup({
    theme = "light", -- 'dark' or 'light'
  })
  vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
  vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
end

return M
