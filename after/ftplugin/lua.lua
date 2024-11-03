vim.opt_local.colorcolumn = '120'
vim.api.nvim_create_autocmd('LspAttach', {
  group = Core.augroup('luaLsp'),
  pattern = '*.lua',
  callback = function(event)
    local map = Core.keymap_buf
    local bufnr = event.buf
    map(bufnr, 'gd', function()
      require('fzf-lua').lsp_definitions({ unique_line_items = true })
    end, 'goto definition')
  end,
  desc = 'set some LSP keybinds for LUA files',
})
