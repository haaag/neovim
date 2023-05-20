-- toggle terminal
-- https://github.com/akinsho/toggleterm.nvim

local M = {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  enabled = true,
}

function M.config()
  local Terminal = require("toggleterm.terminal").Terminal
  require("toggleterm").setup({
    size = 18,
    open_mapping = [[<c-\>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_terminals = false,
    direction = "float", -- | 'horizontal' | 'window' | 'float',
    close_on_exit = true, -- close the terminal window when the process exits
    float_opts = {
      border = "curved",
      winblend = 0,
    },
  })

  local lazygit = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
      border = "curved",
    },
    on_open = function(term)
      vim.cmd("startinsert!")
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
  })

  local run_python = Terminal:new({
    cmd = "python %",
    dir = ".",
    hidden = true,
    direction = "horizontal",
    size = 10,
    -- on_open = function(term)
    --   vim.cmd("startinsert!")
    --   vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    -- end,
  })

  function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
  end

  -- if you only want these mappings for toggle term use term://*toggleterm#* instead
  vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

  vim.keymap.set("n", "<leader>gl", function()
    lazygit:toggle()
  end, { desc = "[L]azy[G]it" })

  vim.keymap.set(
    "n",
    "<leader>tp",
    "<CMD>TermExec cmd='python %' size=10 direction=horizontal<CR>",
    { desc = "[T]erminal [P]ython" }
  )

  vim.keymap.set("n", "<leader>tt", function()
    local bufnr = vim.api.nvim_get_current_buf()
    local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
    if filetype == "python" then
      run_python:toggle()
    end
  end, { desc = "[T]erminal [P]ython" })
end

return M
