---@class me.utils.env
local M = {}

local HOME = os.getenv('HOME')

---@param varname string
---@param default any
---@return string
function M.get(varname, default)
  return Core.getenv('XDG_' .. varname:upper(), default)
end

---@param varname string
---@return boolean
local enabled = function(varname)
  return Core.boolme(Core.getenv(varname, false))
end

---@return string?
M.xdg_home = function()
  return HOME
end

---@return string
M.xdg_data_home = function()
  return M.get('DATA_HOME', HOME .. '/.local/share')
end

---@return string
M.xdg_state_home = function()
  return M.get('STATE_HOME', HOME .. '/.local/state')
end

---@return string
M.xdg_config_home = function()
  return M.get('CONFIG_HOME', HOME .. '/.config')
end

---@return string
M.xdg_cache_home = function()
  return M.get('CACHE_HOME', HOME .. '/.cache')
end

M.debug = enabled('NVIM_DEBUG')
M.testing = enabled('NVIM_TEST')
M.dadbod = enabled('NVIM_DBUI')

return M
