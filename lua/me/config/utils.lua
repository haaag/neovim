-- simple helpers functions

local H = {}

H.ToggleHiddenAll = function()
  if vim.wo.relativenumber then
    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.o.laststatus = 0
  else
    vim.wo.number = true
    vim.wo.relativenumber = true
    vim.o.laststatus = 3
  end
end

H.highlight = setmetatable({}, {
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

return H
