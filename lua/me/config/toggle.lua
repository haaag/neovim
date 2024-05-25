local M = {}

local Utils = require('me.config.utils')
local minimalist = false
local diagnostic_enable = true

function M.statusline()
  if Utils.boolme(vim.opt_local.laststatus._value) then
    vim.opt_local.laststatus = 0
  else
    vim.opt_local.laststatus = 3
  end
end

function M.numbers()
  local enabled = not Utils.boolme(vim.opt_local.relativenumber._value)
  vim.opt_local.number = enabled
  vim.opt_local.relativenumber = enabled
end

function M.signcolumn()
  local value = Utils.boolme(vim.opt_local.signcolumn._value)
  if value then
    vim.opt_local.signcolumn = 'no'
  else
    vim.opt_local.signcolumn = 'yes'
  end
end

function M.gitsings()
  M.signcolumn()
  require('gitsigns').toggle_signs()
end

function M.minimalist()
  minimalist = not minimalist
  if minimalist then
    vim.opt_local.relativenumber = true
    vim.opt_local.number = true
    vim.opt_local.laststatus = 3
    vim.opt_local.signcolumn = 'yes'
  else
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
    vim.opt_local.laststatus = 0
    vim.opt_local.signcolumn = 'no'
  end
end

function M.diagnostic_signs()
  diagnostic_enable = not diagnostic_enable
  if diagnostic_enable then
    vim.diagnostic.enable()
  else
    vim.diagnostic.disable()
  end
end

function M.inlay_hints()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

return M
