-- [[ lua - efm ]]

local M = {}

M.luacheck = function()
  return {
    lintCommand = "luacheck --globals vim --codes --formatter plain --std luajit --filename ${INPUT} -",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = { "%f:%l:%c: %m" },
    lintSource = "luacheck",
  }
end

M.stylua = function()
  return {
    formatCommand = "stylua -s --call-parentheses Always --stdin-filepath ${INPUT} -",
    formatStdin = true,
  }
end

return M
