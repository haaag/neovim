-- lsp.servers.efm.markdown

local M = {}

function M.markdownlint()
  return {
    lintCommand = "markdownlint --stdin",
    lintStdin = true,
    lintformats = {
      "%f:%l %m",
      "%f:%l:%c %m",
      "%f: %l: %m",
    },
    lintSource = "markdownlint",
  }
end

function M.write_good()
  return {
    lintCommand = "write-good --text=${INPUT} --parse",
    lintStdin = true,
    lintformats = {
      "%f:%l %m",
      "%f:%l:%c %m",
      "%f: %l: %m",
    },
    lintSource = "write_good",
  }
end

return M
