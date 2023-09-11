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

M.toggle_all = function()
  if vim.opt_local.relativenumber._value then
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.laststatus = 0
    require('gitsigns').toggle_signs()
    require('me.plugins.lsp.diagnostic').toggle_diagnostics()
  else
    vim.opt_local.number = true
    vim.opt_local.relativenumber = true
    vim.opt_local.laststatus = 3
    require('gitsigns').toggle_signs()
    require('me.plugins.lsp.diagnostic').toggle_diagnostics()
  end
end

M.confirmation = function(mesg, choices)
  local valid_choices = {}

  for _, choice in ipairs(choices) do
    valid_choices[choice:lower()] = true
  end

  local choice = vim.fn.input(mesg)
  choice = choice:lower()

  if valid_choices[choice] then
    return true
  else
    return false
  end
end

M.git_branch = function()
  local cmd = io.popen('git symbolic-ref --short HEAD 2> /dev/null')
  local branch = cmd and cmd:read('*l') or ''
  if cmd then
    cmd:close()
  end
  return branch
end

function M.set_root()
  ---@type string?
  local path = vim.api.nvim_buf_get_name(0)
  path = path ~= '' and vim.loop.fs_realpath(path) or nil
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
    root = vim.fs.find(root_patterns, { path = path, upward = true })[1]
    root = root and vim.fs.dirname(root) or vim.loop.cwd()
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

return M
