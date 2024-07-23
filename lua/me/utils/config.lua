---@class me.utils.config
local M = {}

---@param varname string
---@return boolean
local enabled = function(varname)
  return Core.boolme(Core.getenv(varname, false))
end

M.debug = enabled('NVIM_DEBUG')
M.testing = enabled('NVIM_TEST')
M.dadbod = enabled('NVIM_DBUI')

return M
