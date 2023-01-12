-- diagnostic.lua

local config = {
  virtual_lines = true,
  virtual_text = {
    prefix = " ",
    source = "always",
  },
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

-- Custom Sings
local signs = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " ",
}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "single",
  silent = true,
  focusable = false,
  close_events = { "InsertCharPre", "CursorMoved" },
})

-- diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "[D]iagnostic Prev" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "[D]iagnostic Next" })
vim.keymap.set("n", "[a", vim.diagnostic.open_float, { desc = "[D]iagnostic Float" })
