vim.opt_local.wrap = true
vim.opt_local.spell = true

vim.api.nvim_buf_create_user_command(0, 'LatexRunCompile', function(opts)
  local command = { 'lualatex' }
  local filepath = vim.fn.expand('%:p')
  local filename = vim.api.nvim_buf_get_name(0)
  local file_output = opts.args

  if file_output == '' then
    file_output = filename
  end

  table.insert(command, '-jobname=' .. file_output)
  table.insert(command, filepath)
  local commandString = table.concat(command, ' ')

  local notify_err = function(on_stderr)
    vim.print(on_stderr)
  end

  vim.call('jobstart', commandString, { on_stderr = notify_err })
end, { nargs = '?' })
