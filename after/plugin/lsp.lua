Core.lsp.on_attach(function(_, bufnr)
  -- keymaps
  Core.lsp.keymaps(bufnr)
  -- diagnostics
  vim.diagnostic.config(Core.lsp.diagnostic.defaults)
  -- clean lsp-log if > 500K
  local logpath = Core.env.xdg_state_home() .. '/nvim/' .. 'lsp.log'
  Core.gc_logfile(logpath, 500)
end)

vim.lsp.config('*', { capabilities = Core.lsp.capabilities() })
local servers = {
  'basedpyright',
  'bashls',
  -- 'clangd',
  'docker_compose_language_service',
  'gopls',
  'harper_ls',
  'jsonls',
  'lua_ls',
  'marksman',
  'ruff',
  'taplo',
  'texlab',
  'vtsls',
  'yamlls',
}
for _, name in pairs(servers) do
  vim.lsp.enable(name)
end
