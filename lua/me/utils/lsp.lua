---@class me.utils.lsp
local M = {}

M.diagnostic = require('me.utils.diagnostic')

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

M.code_action = function()
  if not Core.has('fzf-lua') then
    Core.warnme('fzf-lua not installed. https://github.com/ibhagwan/fzf-lua')
    return
  end

  return require('fzf-lua').lsp_code_actions({
    winopts = {
      relative = 'cursor',
      row = 1.01,
      col = 0,
      height = 0.3,
      width = 0.5,
      preview = { hidden = 'hidden' },
    },
  })
end

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
  local logpath = Core.env.xdg_state_home() .. '/nvim/' .. logname
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

---@param bufnr number
function M.keymaps(bufnr)
  local map = Core.keymap_buf
  --[[ map(bufnr, 'gd', function()
    require('fzf-lua').lsp_definitions({ unique_line_items = true })
  end, 'goto definition') ]]
  map(bufnr, 'gr', function()
    require('fzf-lua').lsp_references({ unique_line_items = true })
  end, 'goto references')
  map(bufnr, 'gd', vim.lsp.buf.definition, 'goto definition')
  map(bufnr, 'gD', vim.lsp.buf.declaration, 'goto declaration')
  -- map(bufnr, 'gr', vim.lsp.buf.references, 'goto references')
  map(bufnr, 'gI', vim.lsp.buf.implementation, 'goto implementation')
  map(bufnr, 'gD', vim.lsp.buf.declaration, 'goto declaration')
  map(bufnr, 'gy', vim.lsp.buf.type_definition, 'type definition')
  map(bufnr, 'K', vim.lsp.buf.hover, 'hover documentation')
  map(bufnr, '<c-k>', vim.lsp.buf.signature_help, 'signature documentation', 'i')
  -- lsp
  map(bufnr, '<leader>l', '', '+lsp', { 'n', 'v' })
  map(bufnr, '<leader>lr', vim.lsp.buf.rename, 'rename')
  map(bufnr, '<leader>la', function()
    M.code_action()
  end, 'code action', { 'n', 'v' })
  map(bufnr, '<leader>ld', function()
    require('fzf-lua').lsp_document_symbols({ winopts = { preview = { wrap = 'wrap' } } })
  end, 'document symbols')
  map(bufnr, '<leader>lI', '<CMD>LspInfo<CR>', 'info')
  map(bufnr, '<leader>lc', vim.lsp.codelens.run, 'run codelens', { 'n', 'v' })
  map(bufnr, '<leader>lC', vim.lsp.codelens.refresh, 'refresh n display codelens')
  map(bufnr, '<leader>lws', '<CMD>FzfLua lsp_workspace_symbols<CR>', 'workspace symbols')
  map(bufnr, '<leader>lwa', vim.lsp.buf.add_workspace_folder, 'workspace add folder')
  map(bufnr, '<leader>lwr', vim.lsp.buf.remove_workspace_folder, 'workspace remove Folder')
  map(bufnr, '<leader>lwl', function()
    vim.print(vim.lsp.buf.list_workspace_folders())
  end, 'workspace list folders')
end

return M
