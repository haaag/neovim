-- git commits

local M = {}

M.gitlint = function()
  return {
    lintCommand = "gitlint",
    lintSource = "gitlint",
  }
end

return M
