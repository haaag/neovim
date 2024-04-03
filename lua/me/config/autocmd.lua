-- autocmd.lua
local Util = require('me.config.utils')
local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
  return vim.api.nvim_create_augroup('me_' .. name, { clear = true })
end

autocmd('TextYankPost', {
  group = augroup('highlight_yank'),
  callback = function()
    vim.highlight.on_yank()
  end,
  desc = 'highlight on yank',
})

autocmd('BufWritePost', {
  group = augroup('sxhkd_group'),
  pattern = '*sxhkdrc',
  command = '!pkill -USR1 sxhkd',
  desc = 'update binds when sxhkdrc is updated.',
})

autocmd({ 'FileType' }, {
  group = augroup('easy_close_q'),
  pattern = {
    'qf',
    'help',
    'man',
    'lspinfo',
    'startuptime',
    'netrw',
    'neotest-output',
    'neotest-output-panel',
    'fugitive',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
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
  pattern = { '*xdefaults', '*Xresources', '*.xresources' },
  command = '!xrdb -load ~/.Xresources',
  desc = 'reload xresources after buffer write',
})

autocmd({ 'BufWritePost' }, {
  group = augroup('Dunstrc'),
  pattern = { 'dunstrc' },
  command = '!dunst-theme-loader -r',
  desc = 'reload dunstrc after buffer write',
})

autocmd({ 'TermOpen' }, {
  group = augroup('open_term'),
  callback = function()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
  end,
})

autocmd({ 'BufEnter' }, {
  group = augroup('auto_root'),
  callback = function()
    Util.get_root()
  end,
})

--[[ autocmd({ 'InsertLeave', 'BufWritePost' }, {
  group = augroup('linting'),
  callback = function()
    local lint_status, lint = pcall(require, 'lint')
    if lint_status then
      lint.try_lint()
    end
  end,
  desc = 'lint code via nvim-lint',
}) ]]
