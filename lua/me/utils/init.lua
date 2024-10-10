---@class Core
---@field toggle me.utils.toggle
---@field lsp me.utils.lsp
---@field icons me.utils.icons
---@field colors me.utils.colors
---@field git me.utils.git
---@field env me.utils.env
local M = {}

setmetatable(M, {
  __index = function(tbl, key)
    tbl[key] = require('me.utils.' .. key)
    return tbl[key]
  end,
})

M.highlight = setmetatable({}, {
  __newindex = function(_, hlgroup, args)
    local guifg, guibg, gui, guisp = args.guifg, args.guibg, args.gui, args.guisp
    local cmd = { 'hi', hlgroup }
    if guifg then
      table.insert(cmd, 'guifg=' .. guifg)
    end
    if guibg then
      table.insert(cmd, 'guibg=' .. guibg)
    end
    if gui then
      table.insert(cmd, 'gui=' .. gui)
    end
    if guisp then
      table.insert(cmd, 'guisp=' .. guisp)
    end
    vim.cmd(table.concat(cmd, ' '))
  end,
})

---@param mesg string
---@param choices string[]
function M.confirm(mesg, choices)
  local valid_choices = {}
  for _, choice in ipairs(choices) do
    valid_choices[choice:lower()] = true
  end

  ---@type string
  local choice = vim.fn.input({ prompt = mesg })
  choice = choice:lower()

  if not valid_choices[choice] then
    return false
  end

  return true
end

---@param mesg string
---@return string
function M.input(mesg)
  local choice = vim.fn.input({ prompt = mesg })
  choice = choice:lower()
  return choice
end

M.root_patterns = { '.git', '/lua' }
-- returns the root directory based on:
-- * lsp workspace folders
-- * lsp root_dir
-- * root pattern of filename of the current buffer
-- * root pattern of cwd
---@return string
function M.get_root()
  ---@type string?
  local path = vim.api.nvim_buf_get_name(0)
  path = path ~= '' and vim.loop.fs_realpath(path) or nil
  ---@type string[]
  local roots = {}
  if path then
    for _, client in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
      local workspace = client.config.workspace_folders
      local paths = workspace and vim.tbl_map(function(ws)
        return vim.uri_to_fname(ws.uri)
      end, workspace) or client.config.root_dir and { client.config.root_dir } or {}
      for _, p in ipairs(paths) do
        local r = vim.loop.fs_realpath(p)
        if path:find(r, 1, true) then
          roots[#roots + 1] = r
        end
      end
    end
  end
  table.sort(roots, function(a, b)
    return #a > #b
  end)
  ---@type string?
  local root = roots[1]
  if not root then
    path = path and vim.fs.dirname(path) or vim.loop.cwd()
    ---@type string?
    root = vim.fs.find(M.root_patterns, { path = path, upward = true })[1]
    root = root and vim.fs.dirname(root) or vim.loop.cwd()
  end
  ---@cast root string
  return root
end

function M.find_files()
  if vim.uv.fs_stat(vim.uv.cwd() .. '/.git') then
    require('fzf-lua').git_files()
  else
    require('fzf-lua').files()
  end
end

function M.manpages()
  vim.cmd('FzfLua manpages previewer=man_native')
  -- FzfLua manpages previewer=man_native
  -- require('fzf-lua').manpages({ previewer = { 'man_native' } })
end

---@param array string[]
---@param target any
---@return boolean
function M.contains(array, target)
  for _, value in ipairs(array) do
    if value == target then
      return true
    end
  end
  return false
end

---@param value string
---@return boolean
function M.boolme(value)
  local falseish = { 'false', 'no', 'n', '1', 1, false, nil, 'nil' }
  if M.contains(falseish, value) then
    return false
  end

  return true
end

---@param name string
function M.augroup(name)
  return vim.api.nvim_create_augroup('me_' .. name, { clear = true })
end

---@param name string
function M.get_plugin(name)
  return require('lazy.core.config').spec.plugins[name]
end

---@param varname string
---@param default any: if varname is not set
---@return any
function M.getenv(varname, default)
  local value = os.getenv(varname)
  if not value then
    return default
  end
  return value
end

---@param plugin string
function M.has(plugin)
  return M.get_plugin(plugin) ~= nil
end

--- checks if a given command is executable
---@param cmd string? command to check
---@return boolean
M.is_executable = function(cmd)
  return cmd and vim.fn.executable(cmd) == 1 or false
end

---@param keys string
---@param func function|string
---@param desc string
---@param mode? string|string[]: defaults to 'n'
M.keymap = function(keys, func, desc, mode)
  mode = mode or 'n'
  vim.keymap.set(mode, keys, func, { desc = desc })
end

---@param bufnr number
---@param keys string
---@param func function|string
---@param desc string
---@param mode? string|string[]: defaults to 'n'
M.keymap_buf = function(bufnr, keys, func, desc, mode)
  mode = mode or 'n'
  vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
end

---@generic T
---@param list T[]
---@return T[]
function M.dedup(list)
  local ret = {}
  local seen = {}
  for _, v in ipairs(list) do
    if not seen[v] then
      table.insert(ret, v)
      seen[v] = true
    end
  end
  return ret
end

---@param cmd string
---@return string|nil
M.which = function(cmd)
  local result = io.popen('which ' .. cmd, 'r')
  if not result then
    return nil
  end

  local path = result:read('*a')
  if path == '' then
    return nil
  end

  result:close()
  return path
end

---@param s string
M.warnme = function(s)
  vim.api.nvim_echo({ { s, 'WarningMsg' } }, true, {})
end

---@return boolean
---@param f string
M.file_exist = function(f)
  local file = io.open(f, 'r')
  if not file then
    return false
  end

  return true
end

return M
