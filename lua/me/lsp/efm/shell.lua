-- [[ shell - efm ]]

local M = {}

M.shellcheck = function()
  return {
    lintCommand = "shellcheck -f gcc -x -",
    lintStdin = true,
    lintFormats = { "%f:%l:%c: %trror: %m", "%f:%l:%c: %tarning: %m", "%f:%l:%c: %tote: %m" },
    lintSource = "shellcheck",
  }
end

M.shfmt = function()
  return {
    formatCommand = "shfmt ${-i:tabWidth}",
  }
end

return M
