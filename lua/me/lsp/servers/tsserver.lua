-- tsserver
local lsp_present, lspconfig = pcall(require, "lspconfig")

if lsp_present then
  local on_attach = require("me.lsp").on_attach
  local capabilities = require("me.lsp").capabilities()
  lspconfig.tsserver.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    single_file_support = true,
    init_options = {
      preferences = {
        includeCompletionsWithSnippetText = true,
        includeCompletionsWithInsertText = true,
      },
    },
    settings = {
      completions = {
        completeFunctionCalls = true,
      },
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
  })
end
