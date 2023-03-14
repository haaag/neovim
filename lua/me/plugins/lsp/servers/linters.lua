-- lsp.servers.efm.linters

return {
  misspell = {
    lintCommand = "misspell",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = { "%f:%l:%c: %m" },
    lintSource = "misspell",
  },

  luacheck = {
    lintCommand = "luacheck --globals vim --codes --formatter plain --std luajit --filename ${INPUT} -",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = { "%f:%l:%c: %m" },
    lintSource = "luacheck",
  },

  staticcheck = {
    lintCommand = "staticcheck",
    lintIgnoreExitCode = true,
    lintFormats = { "%f:%l:%c: %m" },
    lintSource = "staticcheck",
  },

  vet = {
    lintCommand = "go vet",
    lintIgnoreExitCode = true,
    lintFormats = { "%f:%l:%c: %m" },
    lintSource = "go vet",
  },

  mypy = {
    lintCommand = "mypy --show-column-numbers --ignore-missing-imports --show-error-codes",
    lintFormats = {
      "%f:%l:%c: %trror: %m",
      "%f:%l:%c: %tarning: %m",
      "%f:%l:%c: %tote: %m",
    },
    lintSource = "mypy",
  },

  flake8 = {
    lintCommand = "pflake8 --format '%(path)s:%(row)d:%(col)d: %(code)s %(code)s %(text)s' --stdin-display-name ${INPUT} -", -- luacheck: ignore
    lintStdin = true,
    lintIgnoreExitCode = true,
    lintFormats = { "%f:%l:%c: %t%n%n%n %m" },
    lintSource = "flake8",
  },

  pylint = {
    lintCommand = "pylint --output-format text --score no --msg-template {path}:{line}:{column}:{C}:{msg} ${INPUT}",
    -- lintFormats = { "%f:%l:%c:%t:%m" },
    lintFormats = { "%.%#:%l:%c: %t%.%#: %m" },
    lintStdin = false,
    lintSource = "pylint",
  },

  ruff = {
    lintCommand = "ruff --stdin-filename --no-fix ${INPUT} -",
    lintStdin = true,
    lintFormats = { "%f:%l:%c: %m" },
    lintSource = "ruff",
  },

  shellcheck = {
    lintCommand = "shellcheck -f gcc -x -",
    lintStdin = true,
    lintFormats = { "%f:%l:%c: %trror: %m", "%f:%l:%c: %tarning: %m", "%f:%l:%c: %tote: %m" },
    lintSource = "shellcheck",
  },

  eslint = {
    lintCommand = "eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {
      "%f(%l,%c): %tarning %m",
      "%f(%l,%c): %rror %m",
    },
    lintSource = "eslint",
  },

  -- markdown
  markdownlint = {
    lintCommand = "markdownlint --stdin",
    lintStdin = true,
    lintFormats = {
      "%f:%l %m",
      "%f:%l:%c %m",
      "%f: %l: %m",
    },
    rootMarkers = {},
    lintSource = "markdownlint",
  },

  write_good = {
    lintCommand = "write-good ${INPUT}",
    lintStdin = false,
    lintFormats = { "%m on line %l at column %c" },
    lintSource = "write_good",
    rootMarkers = {},
  },

  alex = {
    lintCommand = "alex --stdin",
    lintStdin = true,
    lintFormats = {
      "%r%l:%c-%r %terror %m",
      "%r%l:%c-%r %tarning %m",
    },
    lintSource = "alex",
  },
}
