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
  local has_cmp, cmp_nvim = pcall(require, 'cmp_nvim_lsp')
  return vim.tbl_deep_extend(
    'force',
    {},
    vim.lsp.protocol.make_client_capabilities(),
    has_cmp and cmp_nvim.default_capabilities() or {}
  )
end

M.action = setmetatable({}, {
  __index = function(_, action)
    return function()
      vim.lsp.buf.code_action({
        apply = true,
        context = {
          only = { action },
          diagnostics = {},
        },
      })
    end
  end,
})

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

  map('gd', vim.lsp.buf.definition, 'goto definition')
  map('gr', require('telescope.builtin').lsp_references, 'goto references')
  map('gI', vim.lsp.buf.implementation, 'goto implementation')
  map('gD', vim.lsp.buf.declaration, 'goto declaration')
  map('gy', vim.lsp.buf.type_definition, 'type definition')
  map('K', vim.lsp.buf.hover, 'hover documentation')
  map('<c-k>', vim.lsp.buf.signature_help, 'signature documentation', 'i')
  map('<leader>lr', vim.lsp.buf.rename, 'rename')
  map('<leader>la', vim.lsp.buf.code_action, 'code action', { 'n', 'v' })
  map('<leader>lS', require('telescope.builtin').lsp_document_symbols, 'document symbols')
  map('<leader>lI', '<CMD>LspInfo<CR>', 'info')
  map('<leader>lc', vim.lsp.codelens.run, 'run codelens', { 'n', 'v' })
  map('<leader>lC', vim.lsp.codelens.refresh, 'refresh n display codelens')
  map('<leader>lws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'workspace symbols')
  map('<leader>lwa', vim.lsp.buf.add_workspace_folder, 'workspace add folder')
  map('<leader>lwr', vim.lsp.buf.remove_workspace_folder, 'workspace remove Folder')
  map('<leader>lwl', function()
    vim.print(vim.lsp.buf.list_workspace_folders())
  end, 'workspace list folders')
end

M.diagnostic = require('me.utils.diagnostic')

return M
