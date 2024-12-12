local set = vim.opt_local
set.textwidth = 80
set.wrap = true
set.showtabline = 0
set.laststatus = 0
set.cmdheight = 0
vim.cmd('startinsert')
vim.diagnostic.enable(not vim.diagnostic.is_enabled())

---@param bufnr number
local function copy_buffer_to_clipboard(bufnr)
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local text = table.concat(lines, '\n')
  vim.fn.setreg('+', text)
end

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  group = Core.augroup('Scratchpad'),
  pattern = { '*scratchpad' },
  callback = function(event)
    local bufnr = event.buf
    local fname = '/tmp/sc.log'
    vim.fn.writefile({ event.file }, fname, 'a')
    copy_buffer_to_clipboard(bufnr)
  end,
})

set.filetype = 'markdown'
