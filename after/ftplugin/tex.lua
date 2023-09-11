vim.opt_local.wrap = true
vim.opt_local.spell = true
vim.keymap.set('n', '<leader>p', function()
  local fname = vim.fn.expand('%:p')
  local command = 'lualatex ' .. fname
  vim.fn.jobstart(command)
end, { silent = true })

vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('me_latex', { clear = true }),
  pattern = 'resume.tex',
  callback = function(event)
    local fname = event.match
    local notify_err = function(on_stderr)
      vim.print(on_stderr)
    end

    vim.call('jobstart', 'lualatex ' .. fname, { on_stderr = notify_err })
  end,
  desc = 'Recompile resume.tex on save',
})
