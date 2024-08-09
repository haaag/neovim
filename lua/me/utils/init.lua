---@class me.utils: Core
---@field toggle me.utils.toggle
---@field lsp me.utils.lsp
---@field icons me.utils.icons
---@field colors me.utils.colors
---@field config me.utils.config
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

  local choice = vim.fn.input({ prompt = mesg }) ---@type string
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

function M.set_root()
  ---@type string?
  local path = vim.api.nvim_buf_get_name(0)
  path = path ~= '' and vim.uv.fs_realpath(path) or nil
  ---@type string[]
  local root_patterns = { '.git', 'Makefile', 'lua' }
  local roots = {}
  if path then
    for _, client in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
      local workspace = client.config.workspace_folders
      local paths = workspace and vim.tbl_map(function(ws)
        return vim.uri_to_fname(ws.uri)
      end, workspace) or client.config.root_dir and { client.config.root_dir } or {}
      for _, p in ipairs(paths) do
        local r = vim.uv.fs_realpath(p)
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
    path = path and vim.fs.dirname(path) or vim.uv.cwd()
    ---@type string?
    root = vim.fs.find(root_patterns, { path = path, upward = true })[1]
    root = root and vim.fs.dirname(root) or vim.uv.cwd()
  end
  ---@cast root string
  return root
end

function M.get_root()
  -- Array of file names indicating root directory. Modify to your liking.
  local root_patterns = { '.git', 'Makefile', 'lua' }

  -- Cache to use for speed up (at cost of possibly outdated results)
  local root_cache = {}

  -- Get directory path to start search from
  local path = vim.api.nvim_buf_get_name(0)
  if path == '' then
    return
  end
  path = vim.fs.dirname(path)

  -- Try cache and resort to searching upward for root directory
  local root = root_cache[path]
  if root == nil then
    local root_file = vim.fs.find(root_patterns, { path = path, upward = true })[1]
    if root_file == nil then
      return
    end
    root = vim.fs.dirname(root_file)
    root_cache[path] = root
  end

  -- Set current directory
  vim.fn.chdir(root)
end

function M.find_files()
  local builtin
  local theme = require('telescope.themes')
  if vim.uv.fs_stat(vim.uv.cwd() .. '/.git') then
    builtin = 'git_files'
  else
    builtin = 'find_files'
  end
  require('telescope.builtin')[builtin](theme.get_ivy())
end

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

return M
