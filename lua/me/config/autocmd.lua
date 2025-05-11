-- autocmd.lua
local augroup = Core.augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd('TextYankPost', {
  group = augroup('highlight_yank'),
  callback = function()
    (vim.hl or vim.highlight).on_yank()
  end,
  desc = 'highlight on yank',
})

autocmd({ 'FileType' }, {
  group = augroup('easy_close_Q'),
  pattern = {
    'dap-float',
    'fugitive',
    'git',
    'help',
    'lspinfo',
    'man',
    'neotest-output',
    'neotest-output-panel',
    'neotest-summary',
    'netrw',
    'qf',
    'startuptime',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'Q', '<CMD>close<CR>', { buffer = event.buf, silent = true })
  end,
  desc = "use 'Q' to quit from common plugins",
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
  command = '!dunst-ts -r',
  desc = 'reload dunstrc after buffer write',
})

autocmd({ 'FileType' }, {
  group = augroup('json_conceal'),
  pattern = { 'json', 'jsonc', 'json5' },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
  desc = 'fix conceallevel for json files',
})

autocmd('FileType', {
  group = augroup('wrap_spell'),
  pattern = { 'text', 'plaintex', 'typst', 'gitcommit', 'markdown' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

autocmd({ 'BufEnter' }, {
  group = augroup('auto_root'),
  callback = function()
    vim.fn.chdir(Core.get_root())
  end,
})
