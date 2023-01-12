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

return H
