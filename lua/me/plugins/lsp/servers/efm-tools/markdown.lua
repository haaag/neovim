-- lsp.servers.efm.markdown

local M = {}

function M.markdownlint()
  return {
    lintCommand = "markdownlint --stdin",
    lintStdin = true,
    lintFormats = {
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
    -- lintStdin = true,
    lintFormats = {
      "%f:%l %m",
      "%f:%l:%c %m",
      "%f: %l: %m",
    },
    lintSource = "write_good",
  }
end

function M.cbfmt()
  return {
    formatCommand = "cbfmt --best-effort --stdin-filepath ${INPUT}",
    formatStdin = true,
  }
end

return M
