---@class me.utils.lsp
local M = {}

---@param on_attach function
function M.on_attach(on_attach)
  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      on_attach(client, buffer)
    end,
  })
end

-- checks if lsp logfile size is > max_mb and removed
function M.check_logfile_size()
  local MAX_MB = 5
  local logname = 'lsp.log'
  local logpath = os.getenv('XDG_STATE_HOME') .. '/nvim/' .. logname
  local logfile = io.open(logpath, 'r')

  if not logfile then
    return
  end

  local bytes = logfile:seek('end')
  logfile:close()
  local mega = bytes / 1024 / 1024

  if mega > MAX_MB then
    print('LSP logfile size: ' .. math.floor(mega) .. ' MB. Removing ' .. logpath)
    os.remove(logpath)
  end
end

function M.capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local has_cmp, cmp_nvim = pcall(require, 'cmp_nvim_lsp')
  if has_cmp then
    capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.preselectSupport = true
    capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
    capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
    capabilities.textDocument.completion.completionItem.deprecatedSupport = true
    capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
    capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
    capabilities.textDocument.completion.completionItem.resolveSupport = {
      properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
      },
    }
    return cmp_nvim.default_capabilities(capabilities)
  end

  return capabilities
end

---@param bufnr number
function M.keymaps(bufnr)
  ---@param keys string
  ---@param func function|string
  ---@param desc string
  ---@param mode? string|string[]
  local map = function(keys, func, desc, mode)
    mode = mode or 'n'
    vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
  end

  map('<leader>lr', vim.lsp.buf.rename, 'rename')
  map('<leader>la', vim.lsp.buf.code_action, 'code action', { 'n', 'v' })
  map('gd', vim.lsp.buf.definition, 'goto definition')
  map('gr', require('telescope.builtin').lsp_references, 'goto references')
  map('gI', vim.lsp.buf.implementation, 'goto implementation')
  map('<leader>lD', vim.lsp.buf.type_definition, 'type definition')
  map('<leader>lS', require('telescope.builtin').lsp_document_symbols, 'document symbols')
  map('<leader>lI', '<CMD>LspInfo<CR>', 'info')
  map('<leader>lc', vim.lsp.codelens.run, 'run codelens', { 'n', 'v' })
  map('<leader>lC', vim.lsp.codelens.refresh, 'refresh n display codelens')

  map('K', vim.lsp.buf.hover, 'hover documentation')
  map('<C-k>', vim.lsp.buf.signature_help, 'signature documentation')

  map('gD', vim.lsp.buf.declaration, 'goto declaration')

  map('<leader>lws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'workspace symbols')
  map('<leader>lwa', vim.lsp.buf.add_workspace_folder, 'workspace add folder')
  map('<leader>lwr', vim.lsp.buf.remove_workspace_folder, 'workspace remove Folder')
  map('<leader>lwl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, 'workspace list folders')
end

M.diagnostic = require('me.utils.diagnostic')

return M
