-- lsp.servers.efm.go

local M = {}

function M.staticcheck()
  return {
    lintCommand = "staticcheck",
    lintIgnoreExitCode = true,
    lintFormats = { "%f:%l:%c: %m" },
    lintSource = "staticcheck",
  }
end

function M.goimports()
  return {
    formatCommand = "goimports",
    formatStdin = true,
  }
end

function M.go_vet()
  return {
    lintCommand = "go vet",
    lintIgnoreExitCode = true,
    lintFormats = { "%f:%l:%c: %m" },
    lintSource = "go vet",
  }
end

return M
