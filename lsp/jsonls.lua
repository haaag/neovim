-- https://github.com/b0o/SchemaStore.nvim
local ok_store, schemastore = pcall(require, 'schemastore')

---@type vim.lsp.Config
return {
  cmd = { 'vscode-json-language-server', '--stdio' },
  filetypes = { 'json', 'jsonc' },
  init_options = {
    provideFormatter = true,
  },
  on_new_config = function(new_config)
    new_config.settings.json.schemas = new_config.settings.json.schemas or {}

    if ok_store and schemastore.json and schemastore.json.schemas then
      -- only extend if the module loaded successfully
      vim.list_extend(new_config.settings.json.schemas, schemastore.json.schemas())
    end
  end,
  root_markers = { '.git' },
}
