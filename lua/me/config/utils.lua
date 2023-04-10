-- simple helpers functions

local M = {}

M.toggle_numbers = function()
  if vim.opt_local.relativenumber._value then
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.laststatus = 0
  else
    vim.opt_local.number = true
    vim.opt_local.relativenumber = true
    vim.opt_local.laststatus = 3
  end
end

M.highlight = setmetatable({}, {
  __newindex = function(_, hlgroup, args)
    local guifg, guibg, gui, guisp = args.guifg, args.guibg, args.gui, args.guisp
    local cmd = { "hi", hlgroup }
    if guifg then
      table.insert(cmd, "guifg=" .. guifg)
    end
    if guibg then
      table.insert(cmd, "guibg=" .. guibg)
    end
    if gui then
      table.insert(cmd, "gui=" .. gui)
    end
    if guisp then
      table.insert(cmd, "guisp=" .. guisp)
    end
    vim.cmd(table.concat(cmd, " "))
  end,
})

M.toggle_all = function()
  if vim.opt_local.relativenumber._value then
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.laststatus = 0
    require("gitsigns").toggle_signs()
    require("me.plugins.lsp.diagnostic").toggle_diagnostics()
  else
    vim.opt_local.number = true
    vim.opt_local.relativenumber = true
    vim.opt_local.laststatus = 3
    require("gitsigns").toggle_signs()
    require("me.plugins.lsp.diagnostic").toggle_diagnostics()
  end
end

return M
