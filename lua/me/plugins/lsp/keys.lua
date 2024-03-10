-- LSP keys

local M = {}

function M.on_attach(bufnr)
  local nmap = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  -- keys
  nmap('<leader>lr', vim.lsp.buf.rename, 'rename')
  nmap('<leader>la', vim.lsp.buf.code_action, 'code action')
  nmap('gd', vim.lsp.buf.definition, 'goto definition')
  nmap('gr', require('telescope.builtin').lsp_references, 'goto references')
  nmap('gI', vim.lsp.buf.implementation, 'goto implementation')
  nmap('<leader>lD', vim.lsp.buf.type_definition, 'type definition')
  nmap('<leader>ls', require('telescope.builtin').lsp_document_symbols, 'document symbols')

  nmap('K', vim.lsp.buf.hover, 'hover documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'signature documentation')

  nmap('gD', vim.lsp.buf.declaration, 'goto declaration')

  nmap('<leader>lws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'workspace symbols')
  nmap('<leader>lwa', vim.lsp.buf.add_workspace_folder, 'workspace add folder')
  nmap('<leader>lwr', vim.lsp.buf.remove_workspace_folder, 'workspace remove Folder')
  nmap('<leader>lwl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, 'workspace list folders')
end

return M
