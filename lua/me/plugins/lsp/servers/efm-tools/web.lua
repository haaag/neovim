-- webdev - efm

local M = {}

M.eslint = function()
  return {
    lintCommand = "eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {
      "%f(%l,%c): %tarning %m",
      "%f(%l,%c): %rror %m",
    },
    lintSource = "eslint",
  }
end

M.prettier = function()
  return {
    formatCommand = [[$([ -n "$(command -v node_modules/.bin/prettier)" ] && echo "node_modules/.bin/prettier" || echo "prettier") --stdin-filepath ${INPUT} ${--config-precedence:configPrecedence} ${--tab-width:tabWidth} ${--single-quote:singleQuote} ${--trailing-comma:trailingComma}]],
    formatStdin = true,
  }
end

return M
