---@class me.utils.lsp.diagnostic
local M = {}
local icons = Core.icons.lsp().diagnostics

M.defaults = {
  virtual_lines = false,
  virtual_text = false,
  --[[ virtual_text = {
      spacing = 4,
      source = 'if_many',
      prefix = '',
    }, ]]
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.Error,
      [vim.diagnostic.severity.WARN] = icons.Warn,
      [vim.diagnostic.severity.HINT] = icons.Hint,
      [vim.diagnostic.severity.INFO] = icons.Info,
    },
  },
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
}

function M.set_handlers()
  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = 'rounded',
  })

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = 'rounded',
  })

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = 'single',
    silent = true,
    focusable = false,
    close_events = { 'InsertCharPre', 'CursorMoved' },
  })
end

function M.set_keymaps()
  local map = vim.keymap.set
  map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Diagnostic Prev' })
  map('n', ']d', vim.diagnostic.goto_next, { desc = 'Diagnostic Next' })
  map('n', '[D', vim.diagnostic.open_float, { desc = 'Diagnostic Float' })
  map('n', ']D', vim.diagnostic.open_float, { desc = 'Diagnostic Float' })
end

return M
