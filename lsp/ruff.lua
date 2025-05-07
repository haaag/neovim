--- Refer to the [documentation](https://docs.astral.sh/ruff/editors/) for more details.

---@type vim.lsp.Config
return {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
  root_markers = {
    '.ruff.toml',
    'Pipfile',
    'pyproject.toml',
    'requirements.txt',
    'ruff.toml',
    'setup.cfg',
    'setup.py',
    '.git',
  },
  init_options = {
    settings = {
      logLevel = 'error',
    },
  },
  settings = {
    ruff = {
      fix = false,
    },
  },
  on_attach = function(_, bufnr)
    Core.keymap_buf(bufnr, '<leader>lp', '', '+python')
    Core.keymap_buf(bufnr, '<leader>lpo', Core.lsp.action['source.organizeImports'], 'ruff: organize imports')
    Core.keymap_buf(bufnr, '<leader>lpf', Core.lsp.action['source.fixAll'], 'ruff: fix all')
  end,
}
