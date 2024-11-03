-- autocmd.lua
local augroup = Core.augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd('TextYankPost', {
  group = augroup('highlight_yank'),
  callback = function()
    vim.highlight.on_yank()
  end,
  desc = 'highlight on yank',
})

autocmd({ 'FileType' }, {
  group = augroup('easy_close_q'),
  pattern = {
    'dap-float',
    -- 'fugitive',
    'git',
    'help',
    'lspinfo',
    'man',
    'neotest-output',
    'neotest-output-panel',
    'netrw',
    'qf',
    'startuptime',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<CMD>close<CR>', { buffer = event.buf, silent = true })
  end,
  desc = "use 'q' to quit from common plugins",
})

autocmd('BufReadPost', {
  group = augroup('last_location'),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
  desc = 'go to last loc when opening a buffer',
})

autocmd({ 'BufWritePost' }, {
  group = augroup('Xresources'),
  pattern = { '*xdefaults', '*Xresources', '*xresources' },
  command = '!xrdb -load ~/.config/X11/xresources',
  desc = 'reload xresources after buffer write',
})

autocmd({ 'BufWritePost' }, {
  group = augroup('Dunstrc'),
  pattern = { 'dunstrc' },
  command = '!dunst-theme-loader -r',
  desc = 'reload dunstrc after buffer write',
})

-- this breaks fzf
-- autocmd({ 'TermOpen' }, {
--   group = augroup('open_term'),
--   callback = function()
--     local opts = { noremap = true }
--     vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
--     vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
--     vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
--     vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
--     vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
--   end,
-- })

autocmd({ 'BufEnter' }, {
  group = augroup('auto_root'),
  callback = function()
    vim.fn.chdir(Core.get_root())
  end,
})
