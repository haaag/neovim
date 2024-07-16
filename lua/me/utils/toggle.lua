---@class me.utils.toggle
local M = {}

local minimalist = false

function M.statusline()
  if Core.boolme(vim.opt_local.laststatus._value) then
    vim.opt_local.laststatus = 0
    return
  end
  vim.opt_local.laststatus = 3
end

function M.laststatus()
  local choice = Core.input('which statusline?> ')
  vim.opt_local.laststatus = tonumber(choice)
end

function M.numbers()
  local enabled = not Core.boolme(vim.opt_local.relativenumber._value)
  vim.opt_local.number = enabled
  vim.opt_local.relativenumber = enabled
end

function M.signcolumn()
  if Core.boolme(vim.opt_local.signcolumn._value) then
    vim.opt_local.signcolumn = 'no'
    return
  end
  vim.opt_local.signcolumn = 'yes'
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
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end

function M.inlay_hints()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

function M.scrollsync()
  vim.cmd('set scb!')
end

return M
