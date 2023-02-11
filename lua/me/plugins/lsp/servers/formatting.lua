return {
  stylua = {
    formatCommand = "stylua -s --call-parentheses Always --stdin-filepath ${INPUT} -",
    formatStdin = true,
  },

  goimports = {
    formatCommand = "goimports",
    formatStdin = true,
  },

  cbfmt = {
    formatCommans = "cbfmt --best-effort --stdin-filepath ${INPUT}",
    formatStdin = true,
  },

  isort = {
    formatCommand = "isort --stdout ${-l:lineLength} --profile black -",
    formatStdin = true,
  },

  black = {
    formatCommand = "black --fast ${-l:lineLength} -",
    formatStdin = true,
  },

  shfmt = {
    formatCommand = "shfmt ${-i:tabWidth}",
  },

  prettier = {
    formatCommand = [[$([ -n "$(command -v node_modules/.bin/prettier)" ] && echo "node_modules/.bin/prettier" || echo "prettier") --stdin-filepath ${INPUT} ${--config-precedence:configPrecedence} ${--tab-width:tabWidth} ${--single-quote:singleQuote} ${--trailing-comma:trailingComma}]],
    formatStdin = true,
  },

}
