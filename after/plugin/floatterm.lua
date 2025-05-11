local state = {
  floating = {
    buf = -1,
    win = -1,
  },
}

Core.keymap('<C-\\>', '<CMD>FloatTerm<CR>', 'toggle term', { 'n', 't' })
Core.keymap('<ESC><ESC>', '<C-\\><C-n>', 'term normal', 't')

local function create_floating_window(opts)
  opts = opts or {}
  local width = opts.width or math.floor(vim.o.columns * 0.7)
  local height = opts.height or math.floor(vim.o.lines * 0.7)

  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  })

  return { buf = buf, win = win }
end

local toggle_term = function()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_floating_window({ buf = state.floating.buf })
    if vim.bo[state.floating.buf].buftype ~= 'terminal' then
      vim.cmd.terminal()
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end

vim.api.nvim_create_user_command('FloatTerm', toggle_term, {})

-- this autocmd interferes with neotest
-- local autocmd = vim.api.nvim_create_autocmd
-- autocmd({ 'TermOpen' }, {
--   callback = function()
--     vim.cmd('startinsert')
--   end,
-- })
