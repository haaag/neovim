-- lsp.servers.efm.python

local M = {}

M.isort = function()
  return {
    formatCommand = "isort --stdout ${-l:lineLength} --profile black -",
    formatStdin = true,
  }
end

M.mypy = function()
  return {
    lintCommand = "mypy --show-column-numbers --ignore-missing-imports --show-error-codes",
    lintFormats = {
      "%f:%l:%c: %trror: %m",
      "%f:%l:%c: %tarning: %m",
      "%f:%l:%c: %tote: %m",
    },
    lintSource = "mypy",
  }
end

M.black = function()
  return {
    formatCommand = "black --fast ${-l:lineLength} -",
    formatStdin = true,
  }
end

M.flake8 = function()
  return {
    lintCommand = "pflake8 --format '%(path)s:%(row)d:%(col)d: %(code)s %(code)s %(text)s' --stdin-display-name ${INPUT} -",
    lintStdin = true,
    lintIgnoreExitCode = true,
    lintFormats = { "%f:%l:%c: %t%n%n%n %m" },
    lintSource = "flake8",
  }
end

M.pylint = function()
  return {
    lintCommand = "pylint --output-format text --score no --msg-template {path}:{line}:{column}:{C}:{msg} ${INPUT}",
    lintFormats = { "%f:%l:%c:%t:%m" },
    formatStdin = false,
    lintSource = "pylint",
  }
end

M.ruff = function()
  return {
    lintCommand = "ruff --stdin-filename ${INPUT} -",
    lintStdin = true,
    lintFormats = { "%f:%l:%c: %m" },
    lintSource = "ruff",
  }
end

return M
